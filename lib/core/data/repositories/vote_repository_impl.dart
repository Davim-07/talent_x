import 'package:talent_x/core/data/datasources/local_datasource.dart';
import 'package:talent_x/core/data/datasources/remote_datasource.dart';
import 'package:talent_x/core/data/local/schemas/artist_schema.dart';
import 'package:talent_x/core/data/local/schemas/jury_rank_schema.dart';
import 'package:talent_x/core/data/local/schemas/vote_schema.dart';
import 'package:talent_x/core/data/models/artist_model.dart';
import 'package:talent_x/core/data/models/jury_rank_model.dart';
import 'package:talent_x/core/data/models/vote_model.dart';
import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/domain/entities/jury_rank.dart';
import 'package:talent_x/core/domain/entities/vote.dart';
import 'package:talent_x/core/domain/repositorires/vote_repository.dart';

class VoteRepositoryImpl implements VoteRepository {
  final IsarLocalDataSource _localDS;
  final FirestoreRemoteDataSource _remoteDS;

  VoteRepositoryImpl({
    required IsarLocalDataSource localDS,
    required FirestoreRemoteDataSource remoteDS,
  })  : _localDS = localDS,
        _remoteDS = remoteDS;

  // ===========================================================================
  // 1. CAST VOTE (OFFLINE-FIRST)
  // ===========================================================================
  @override
  Future<void> castVote({
    required String artistId,
    required String competitionId,
  }) async {
    // ID généré de manière unique (Exemple basique, à remplacer par FirebaseAuth.instance.currentUser?.uid)
    const String currentUserId = "current_user_id";
    final String generatedVoteId =
        "${currentUserId}_${competitionId}_$artistId";

    final voteModel = VoteModel(
      id: generatedVoteId,
      artistId: artistId,
      competitionId: competitionId,
      voterId: currentUserId,
      txPoints: 2, // Valeur par défaut pour un vote public/artiste
      createdAt: DateTime.now(),
    );

    // A. Écriture immédiate dans Isar (Offline)
    final schema = voteModel.toSchema(isSynced: false);
    await _localDS.save<VoteSchema>(schema);

    // B. Tentative de synchronisation vers Cloud Firestore (Remote)
    try {
      await _remoteDS.setDocument(
        collectionPath: 'votes',
        docId: voteModel.id,
        data: voteModel.toFirestore(),
      );

      // En cas de succès, on met à jour le statut isSynced en local
      schema.isSynced = true;
      await _localDS.save<VoteSchema>(schema);
    } catch (_) {
      // Si l'utilisateur est hors-ligne, Isar conserve isSynced = false.
      // Le Worker de synchronisation s'en chargera une fois la connexion rétablie.
    }
  }

  // ===========================================================================
  // 2. SET MY RANK (JURY)
  // ===========================================================================
  @override
  Future<void> setMyRank({
    required String artistId,
    required String competitionId,
    required int rank,
  }) async {
    const String currentJuryId = "current_jury_id";
    final String docId = "${currentJuryId}_${competitionId}_$artistId";

    final juryRankModel = JuryRankModel(
      juryId: currentJuryId,
      artistId: artistId,
      competitionId: competitionId,
      rank: rank,
    );

    // Écriture Isar local
    final schema = juryRankModel.toSchema(isSynced: false);
    await _localDS.save<JuryRankSchema>(schema);

    // Envoi Firestore
    try {
      await _remoteDS.setDocument(
        collectionPath: 'jury_ranks',
        docId: docId,
        data: juryRankModel.toFirestore(),
      );

      schema.isSynced = true;
      await _localDS.save<JuryRankSchema>(schema);
    } catch (_) {}
  }

  // ===========================================================================
  // 3. GET VOTES FOR ARTIST (STREAM TEMPS RÉEL)
  // ===========================================================================
  @override
  Stream<List<Vote>> getVotesForArtist() {
    _syncVotesFromRemote();
    // Écoute Isar en temps réel
    return _localDS.watchAll<VoteSchema>().map((schemas) {
      return schemas.map((s) => VoteModel.fromSchema(s)).toList();
    });
  }

  // ===========================================================================
  // 4. GET VOTES FOR COMPETITION (STREAM TEMPS RÉEL)
  // ===========================================================================
  @override
  Stream<List<Vote>> getVotesForCompetition(String competitionId) {
    _syncVotesFromRemote();
    return _localDS.watchAll<VoteSchema>().map((schemas) {
      return schemas
          .where((s) => s.competitionId == competitionId)
          .map((s) => VoteModel.fromSchema(s))
          .toList();
    });
  }

  // ===========================================================================
  // 5. GET ALL JURY RANKS
  // ===========================================================================
  @override
  Stream<List<JuryRank>> getAllJuryRanks(String competitionId) {
    _syncJuryRanksFromRemote();
    return _localDS.watchAll<JuryRankSchema>().map((schemas) {
      return schemas
          .where((s) => s.competitionId == competitionId)
          .map((s) => JuryRankModel.fromSchema(s))
          .toList();
    });
  }

  // ===========================================================================
  // 6. GET FINAL TOP 10 (CALCUL DE LA MOYENNE DES JURYS)
  // ===========================================================================
  @override
  Stream<List<Artist>> getFinalTop10(String competitionId) {
    return _localDS.watchAll<JuryRankSchema>().asyncMap((jurySchemas) async {
      // 1. Filtrer les notes du jury pour cette compétition
      final compRanks =
          jurySchemas.where((s) => s.competitionId == competitionId);

      // 2. Calculer le score / rang moyen par artiste
      final Map<String, List<int>> artistRanksMap = {};
      for (var r in compRanks) {
        artistRanksMap.putIfAbsent(r.artistId, () => []).add(r.rank);
      }

      // Map pour stocker la moyenne des rangs par artiste
      final Map<String, double> averages = {};
      artistRanksMap.forEach((artistId, ranks) {
        final sum = ranks.reduce((a, b) => a + b);
        averages[artistId] = sum / ranks.length;
      });

      // 3. Trier les artistes selon la meilleure moyenne (rang 1 étant le meilleur)
      final sortedArtistIds = averages.keys.toList()
        ..sort((a, b) => averages[a]!.compareTo(averages[b]!));

      // 4. Prendre le Top 10
      final top10Ids = sortedArtistIds.take(10).toList();

      // 5. Récupérer les entités Artists correspondantes depuis Isar
      final allArtistSchemas = await _localDS.getAll<ArtistSchema>();

      final top10Artists = top10Ids.map((id) {
        final schema = allArtistSchemas.firstWhere(
          (a) => a.id == id,
          orElse: () => ArtistSchema()
            ..id = id
            ..name = 'Artiste inconnu',
        );
        return ArtistModel.fromSchema(schema);
      }).toList();

      return top10Artists;
    });
  }

  // ===========================================================================
  // 7. HAS ALREADY VOTED (VERIFICATION LOCALE RAPIDE)
  // ===========================================================================
  @override
  Future<bool> hasAlreadyVoted({
    required String artistId,
    required String competitionId,
  }) async {
    const String currentUserId = "current_user_id";
    final allVotes = await _localDS.getAll<VoteSchema>();

    return allVotes.any((v) =>
        v.voterId == currentUserId &&
        v.competitionId == competitionId &&
        v.artistId == artistId);
  }

  void _syncVotesFromRemote() async {
    try {
      final remoteDocs = await _remoteDS.getCollection(collectionPath: 'votes');
      final schemas = remoteDocs.map((doc) {
        final model = VoteModel.fromFirestore(doc, doc['id'] ?? '');
        return model.toSchema(isSynced: true);
      }).toList();
      await _localDS.saveAll<VoteSchema>(schemas);
    } catch (_) {}
  }

  void _syncJuryRanksFromRemote() async {
    try {
      final remoteDocs = await _remoteDS.getCollection(collectionPath: 'jury_ranks');
      final schemas = remoteDocs.map((doc) {
        final model = JuryRankModel.fromFirestore(doc, doc['id'] ?? '');
        return model.toSchema(isSynced: true);
      }).toList();
      await _localDS.saveAll<JuryRankSchema>(schemas);
    } catch (_) {}
  }
}
