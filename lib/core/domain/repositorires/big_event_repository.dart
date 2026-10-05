import 'package:talent_x/core/domain/entities/big_event.dart';

abstract class BigEventRepository {
  /// Récupérer la liste de tous les grands événements en temps réel
  Stream<List<BigEvent>> getAllBigEvents();

  /// Récupérer les événements triés du plus récent au plus ancien
  Stream<List<BigEvent>> getLatestBigEvents();

  /// Rechercher un BigEvent par son titre
  Future<BigEvent?> searchBigEvent(String title);

  /// Ajouter ou sauvegarder un grand événement
  Future<void> saveBigEvent(BigEvent bigEvent);

  /// Supprimer un grand événement par son titre
  Future<void> deleteBigEvent(String title);
}
