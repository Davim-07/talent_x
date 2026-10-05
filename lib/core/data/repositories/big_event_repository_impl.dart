import 'package:talent_x/core/data/datasources/local_datasource.dart';
import 'package:talent_x/core/data/datasources/remote_datasource.dart';
import 'package:talent_x/core/data/local/schemas/big_event_schema.dart';
import 'package:talent_x/core/data/models/big_event_model.dart';
import 'package:talent_x/core/domain/entities/big_event.dart';
import 'package:talent_x/core/domain/repositorires/big_event_repository.dart';

class BigEventRepositoryImpl implements BigEventRepository {
  final IsarLocalDataSource _localDS;
  final FirestoreRemoteDataSource _remoteDS;

  BigEventRepositoryImpl({
    required IsarLocalDataSource localDS,
    required FirestoreRemoteDataSource remoteDS,
  })  : _localDS = localDS,
        _remoteDS = remoteDS;

  // ===========================================================================
  // 1. GET ALL BIG EVENTS (STREAM EN TEMPS RÉEL ISAR + SYNC FIRESTORE)
  // ===========================================================================
  @override
  Stream<List<BigEvent>> getAllBigEvents() {
    // Synchronisation d'arrière-plan
    _syncBigEventsFromRemote();

    // Écoute de la BDD Isar
    return _localDS.watchAll<BigEventSchema>().map((schemas) {
      return schemas.map((s) => BigEventModel.fromSchema(s)).toList();
    });
  }

  // ===========================================================================
  // 2. GET LATEST BIG EVENTS (TRIÉS PAR DATE DÉCROISSANTE)
  // ===========================================================================
  @override
  Stream<List<BigEvent>> getLatestBigEvents() {
    return _localDS.watchAll<BigEventSchema>().map((schemas) {
      final events = schemas.map((s) => BigEventModel.fromSchema(s)).toList();

      // Tri par date de création (du plus récent au plus ancien)
      events.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return events;
    });
  }

  // ===========================================================================
  // 3. SEARCH BIG EVENT BY TITLE
  // ===========================================================================
  @override
  Future<BigEvent?> searchBigEvent(String title) async {
    final schemas = await _localDS.getAll<BigEventSchema>();

    final match = schemas.where((s) =>
        s.title.toLowerCase().contains(title.toLowerCase())).firstOrNull;

    if (match != null) {
      return BigEventModel.fromSchema(match);
    }

    return null;
  }

  // ===========================================================================
  // 4. SAVE BIG EVENT (OFFLINE-FIRST)
  // ===========================================================================
  @override
  Future<void> saveBigEvent(BigEvent bigEvent) async {
    final model = BigEventModel(
      title: bigEvent.title,
      subtitle: bigEvent.subtitle,
      imageUrl: bigEvent.imageUrl,
    );

    // 1. Écriture Isar locale immédiate
    final schema = model.toSchema(isSynced: false);
    await _localDS.save<BigEventSchema>(schema);

    // 2. Tentative de publication sur Firebase (utilisation du titre nettoyé ou slug comme docId)
    final docId = bigEvent.title.replaceAll(' ', '_').toLowerCase();

    try {
      await _remoteDS.setDocument(
        collectionPath: 'big_events',
        docId: docId,
        data: model.toFirestore(),
      );

      schema.isSynced = true;
      await _localDS.save<BigEventSchema>(schema);
    } catch (_) {
      // Conserve isSynced = false en cas d'absence de réseau
    }
  }

  // ===========================================================================
  // 5. DELETE BIG EVENT
  // ===========================================================================
  @override
  Future<void> deleteBigEvent(String title) async {
    // 1. Suppression dans Isar local
    final schemas = await _localDS.getAll<BigEventSchema>();
    final target = schemas.where((s) => s.title == title).firstOrNull;

    if (target != null) {
      await _localDS.delete<BigEventSchema>(target.localId);
    }

    // 2. Suppression dans Firestore
    final docId = title.replaceAll(' ', '_').toLowerCase();
    try {
      await _remoteDS.deleteDocument(
        collectionPath: 'big_events',
        docId: docId,
      );
    } catch (_) {
      // Gestion du cas hors-ligne
    }
  }

  // ===========================================================================
  // SYNCHRONISATION REMOTE -> LOCAL
  // ===========================================================================
  void _syncBigEventsFromRemote() async {
    try {
      final remoteDocs = await _remoteDS.getCollection(collectionPath: 'big_events');

      final schemas = remoteDocs.map((doc) {
        final model = BigEventModel.fromFirestore(doc, doc['title'] ?? '');
        return model.toSchema(isSynced: true);
      }).toList();

      await _localDS.saveAll<BigEventSchema>(schemas);
    } catch (_) {
      // Silencieux hors-ligne
    }
  }
}