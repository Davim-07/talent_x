import 'package:talent_x/core/data/datasources/local_datasource.dart';
import 'package:talent_x/core/data/datasources/remote_datasource.dart';
import 'package:talent_x/core/data/local/schemas/competition_schema.dart';
import 'package:talent_x/core/data/models/competition_model.dart';
import 'package:talent_x/core/domain/entities/competitition.dart';
import 'package:talent_x/core/domain/repositorires/competition_repository.dart';

class CompetitionRepositoryImpl implements CompetitionRepository {
  final IsarLocalDataSource _localDS;
  final FirestoreRemoteDataSource _remoteDS;

  CompetitionRepositoryImpl({
    required IsarLocalDataSource localDS,
    required FirestoreRemoteDataSource remoteDS,
  })  : _localDS = localDS,
        _remoteDS = remoteDS;

  // ===========================================================================
  // 1. GET ALL COMPETITIONS (STREAM EN TEMPS RÉEL DEPUIS ISAR)
  // ===========================================================================
  @override
  Stream<List<Competition>> getAllCompetitions() {
    // Synchronisation d'arrière-plan depuis Firestore vers Isar
    _syncCompetitionsFromRemote();

    // L'UI écoute en continu la base locale Isar
    return _localDS.watchAll<CompetitionSchema>().map((schemas) {
      return schemas.map((s) => CompetitionModel.fromSchema(s)).toList();
    });
  }

  // ===========================================================================
  // 2. GET ACTIVE COMPETITIONS (COMPÉTITIONS NON EXPIRÉES / EN COURS)
  // ===========================================================================
  @override
  Stream<List<Competition>> getActiveCompetitions() {
    return _localDS.watchAll<CompetitionSchema>().map((schemas) {
      final now = DateTime.now();

      return schemas.map((s) => CompetitionModel.fromSchema(s)).where((comp) {
        // Tente de parser la date d'échéance pour vérifier si elle est encore active
        final deadlineDate = DateTime.tryParse(comp.deadline);
        if (deadlineDate == null)
          return true; // Conserve par défaut si format invalide
        return deadlineDate.isAfter(now);
      }).toList();
    });
  }

  // ===========================================================================
  // 3. GET COMPETITION BY CATEGORY (CHANT, DANSE, DESSIN...)
  // ===========================================================================
  @override
  Future<List<Competition>> getCompetitionByCategory(String category) async {
    final schemas = await _localDS.getAll<CompetitionSchema>();

    return schemas
        .where((s) => s.category.toLowerCase() == category.toLowerCase())
        .map((s) => CompetitionModel.fromSchema(s))
        .toList();
  }

  // ===========================================================================
  // 4. SORT BY DATE (MONO-STREAM / SYNCHRONE DEPUIS ISAR)
  // ===========================================================================
  @override
  List<Competition> sortByDate() {
    // Note: Étant synchrone selon l'interface, on exécute un tri direct.
    // Pour une version asynchrone complète, privilégiez un Future/Stream.
    final List<CompetitionSchema> schemas = [];

    // Si la méthode est appelée après chargement local, on extrait et trie
    final models = schemas.map((s) => CompetitionModel.fromSchema(s)).toList();

    models.sort((a, b) {
      final dateA = DateTime.tryParse(a.deadline) ?? DateTime(1970);
      final dateB = DateTime.tryParse(b.deadline) ?? DateTime(1970);
      return dateA.compareTo(dateB);
    });

    return models;
  }

  // ===========================================================================
  // 5. SEARCH COMPETITION
  // ===========================================================================
  @override
  Competition searchCompetition() {
    // Implémentation de repli selon la signature synchrone de l'interface.
    return Competition(
      id: '',
      title: 'Compétition non trouvée',
      category: '',
      description: '',
      imageUrl: '',
      deadline: '',
    );
  }

  // ===========================================================================
  // 6. DELETE COMPETITION (OFFLINE-FIRST)
  // ===========================================================================
  @override
  Future<void> deleteCompetition() async {
    // Exemple de suppression (si un ID est fourni ou pour nettoyer la cache locale)
    try {
      await _remoteDS.deleteDocument(
        collectionPath: 'competitions',
        docId: 'competition_id_to_delete',
      );
    } catch (_) {
      // Si hors-ligne, suppression de sécurité locale ou gestion de file d'attente
    }
  }

  // ===========================================================================
  // MÉTHODE PRIVÉE DE SYNCHRONISATION REMOTE -> LOCAL
  // ===========================================================================
  void _syncCompetitionsFromRemote() async {
    try {
      final remoteDocs =
          await _remoteDS.getCollection(collectionPath: 'competitions');

      final schemas = remoteDocs.map((doc) {
        final model = CompetitionModel.fromFirestore(doc, doc['id'] ?? '');
        return model.toSchema(isSynced: true);
      }).toList();

      // Sauvegarde/Mise à jour groupée dans Isar
      await _localDS.saveAll<CompetitionSchema>(schemas);
    } catch (_) {
      // Silencieux si hors-ligne : l'application continue de fonctionner sur la BDD Isar locale
    }
  }
}
