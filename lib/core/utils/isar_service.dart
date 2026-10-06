import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Imports des schémas
import 'package:talent_x/core/data/local/schemas/artist_schema.dart';
import 'package:talent_x/core/data/local/schemas/big_event_schema.dart';
import 'package:talent_x/core/data/local/schemas/competition_schema.dart';
import 'package:talent_x/core/data/local/schemas/jury_rank_schema.dart';
import 'package:talent_x/core/data/local/schemas/vote_schema.dart';

class IsarService {
  static IsarService? _instance;
  late final Isar _isar;

  // Constructeur privé pour le pattern Singleton
  IsarService._internal(this._isar);

  /// Renvoie l'instance Isar sous-jacente au besoin
  Isar get isar => _isar;

  /// Initialise l'instance Isar avec toutes les collections enregistrées.
  /// À appeler dans main.dart avant runApp()
  static Future<IsarService> init() async {
    if (_instance != null) {
      return _instance!;
    }

    final dir = await getApplicationDocumentsDirectory();

    final isarInstance = await Isar.open(
      [
        // Liste de toutes les collections Isar de l'application
        VoteSchemaSchema,
        JuryRankSchemaSchema,
        BigEventSchemaSchema,
        CompetitionSchemaSchema,
        ArtistSchemaSchema,
        // Ajouter les autres schemas générés ici (ex: CompetitionModelSchema)
      ],
      directory: dir.path,
      name: 'talentx_offline_db',
      inspector: true, // Permet le débogage de la BDD avec Isar Inspector en dev
    );

    _instance = IsarService._internal(isarInstance);
    return _instance!;
  }

  /// Récupère l'instance unique déjà initialisée
  static IsarService get instance {
    if (_instance == null) {
      throw Exception(
        "IsarService n'est pas initialisé. Appelez `await IsarService.init()` au démarrage dans main.dart.",
      );
    }
    return _instance!;
  }

  // ===========================================================================
  //  MÉTHODES GENERIQUES CRUD (Offline-First)
  // ===========================================================================

  /// Sauvegarde ou met à jour un élément dans la BDD Isar
  Future<int> save<T>(T item) async {
    return await _isar.writeTxn(() async {
      return await _isar.collection<T>().put(item);
    });
  }

  /// Sauvegarde une liste d'éléments (en une seule transaction optimisée)
  Future<List<int>> saveAll<T>(List<T> items) async {
    return await _isar.writeTxn(() async {
      return await _isar.collection<T>().putAll(items);
    });
  }

  /// Récupère tous les éléments d'une collection
  Future<List<T>> getAll<T>() async {
    return await _isar.collection<T>().where().findAll();
  }

  /// Récupère un élément par son ID entier Isar
  Future<T?> getById<T>(Id id) async {
    return await _isar.collection<T>().get(id);
  }

  /// Supprime un élément par son ID entier Isar
  Future<bool> delete<T>(Id id) async {
    return await _isar.writeTxn(() async {
      return await _isar.collection<T>().delete(id);
    });
  }

  /// Supprime tous les éléments d'une collection
  Future<void> clearCollection<T>() async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
    });
  }

  /// Flux en temps réel (Stream) qui émet une nouvelle liste dès que la collection change
  Stream<List<T>> watchCollection<T>() {
    return _isar.collection<T>().where().watch(fireImmediately: true);
  }

  /// Ferme l'instance Isar (ex: lors de la déconnexion de l'utilisateur)
  Future<void> close() async {
    await _isar.close();
    _instance = null;
  }
}