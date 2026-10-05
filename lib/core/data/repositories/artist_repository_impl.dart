import 'package:talent_x/core/data/datasources/local_datasource.dart';
import 'package:talent_x/core/data/datasources/remote_datasource.dart';
import 'package:talent_x/core/data/local/schemas/artist_schema.dart';
import 'package:talent_x/core/data/local/schemas/vote_schema.dart';
import 'package:talent_x/core/data/models/artist_model.dart';
import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/domain/repositorires/artist_repository.dart';

class ArtistRepositoryImpl implements ArtistRepository {
  final IsarLocalDataSource _localDS;
  final FirestoreRemoteDataSource _remoteDS;

  ArtistRepositoryImpl({
    required IsarLocalDataSource localDS,
    required FirestoreRemoteDataSource remoteDS,
  })  : _localDS = localDS,
        _remoteDS = remoteDS;

  @override
  Stream<List<Artist>> getAllArtists() {
    _syncArtistsFromRemote();
    return _localDS.watchAll<ArtistSchema>().map((schemas) {
      return schemas.map((s) => ArtistModel.fromSchema(s)).toList();
    });
  }

  @override
  Stream<List<Artist>> sortByName() {
    return _localDS.watchAll<ArtistSchema>().map((schemas) {
      final artists = schemas.map((s) => ArtistModel.fromSchema(s)).toList();
      artists.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return artists;
    });
  }

  @override
  Future<List<Artist>> getSelectedArtists(String competitionId) async {
    final allArtists = await _localDS.getAll<ArtistSchema>();
    // Filtrage local selon la compétition (à adapter selon les champs de votre entité)
    return allArtists.map((s) => ArtistModel.fromSchema(s)).toList();
  }

  @override
  Future<List<Artist>> getArtistsSortedByPoints(String competitionId) async {
    final allArtists = await _localDS.getAll<ArtistSchema>();
    final allVotes = await _localDS.getAll<VoteSchema>();

    // Calcul du total des points TX accumulés par artiste pour cette compétition
    final Map<String, int> pointsMap = {};
    for (var vote in allVotes.where((v) => v.competitionId == competitionId)) {
      pointsMap[vote.artistId] = (pointsMap[vote.artistId] ?? 0) + vote.txPoints;
    }

    final artists = allArtists.map((s) => ArtistModel.fromSchema(s)).toList();

    // Tri décroissant par points TX
    artists.sort((a, b) {
      final pointsA = pointsMap[a.id] ?? 0;
      final pointsB = pointsMap[b.id] ?? 0;
      return pointsB.compareTo(pointsA);
    });

    return artists;
  }

  @override
  Future<void> deleteArtist(String artistId) async {
    // 1. Suppression locale dans Isar
    final schemas = await _localDS.getAll<ArtistSchema>();
    final target = schemas.where((s) => s.id == artistId).firstOrNull;
    if (target != null) {
      await _localDS.delete<ArtistSchema>(target.localId);
    }

    // 2. Suppression distante dans Firestore
    try {
      await _remoteDS.deleteDocument(
        collectionPath: 'artists',
        docId: artistId,
      );
    } catch (_) {
      // Gestion du cas hors-ligne
    }
  }

  void _syncArtistsFromRemote() async {
    try {
      final remoteDocs = await _remoteDS.getCollection(collectionPath: 'artists');
      final schemas = remoteDocs.map((doc) {
        final model = ArtistModel.fromFirestore(doc, doc['id'] ?? '');
        return model.toSchema(isSynced: true);
      }).toList();

      await _localDS.saveAll<ArtistSchema>(schemas);
    } catch (_) {}
  }
}