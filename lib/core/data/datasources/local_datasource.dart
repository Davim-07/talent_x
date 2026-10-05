import 'package:isar/isar.dart';
import '../../utils/isar_service.dart';

class IsarLocalDataSource {
  final IsarService _isarService;

  IsarLocalDataSource(this._isarService);

  Isar get _isar => _isarService.isar;

  /// Sauvegarder ou mettre à jour un schéma
  Future<void> save<T>(T schema) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().put(schema);
    });
  }

  /// Sauvegarder une liste de schémas (Transaction groupée)
  Future<void> saveAll<T>(List<T> schemas) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().putAll(schemas);
    });
  }

  /// Récupérer tous les éléments d'un schéma
  Future<List<T>> getAll<T>() async {
    return await _isar.collection<T>().where().findAll();
  }

  /// Écouter la collection en temps réel (Stream)
  Stream<List<T>> watchAll<T>() {
    return _isar.collection<T>().where().watch(fireImmediately: true);
  }

  /// Supprimer un élément par son Isar ID (int)
  Future<bool> delete<T>(Id isarId) async {
    return await _isar.writeTxn(() async {
      return await _isar.collection<T>().delete(isarId);
    });
  }

  /// Vider une collection locale
  Future<void> clear<T>() async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
    });
  }
}
