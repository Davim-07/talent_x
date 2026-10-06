import 'package:talent_x/core/domain/entities/artist.dart';

abstract class ArtistRepository {
  /// Lister tous les artistes
  Stream<List<Artist>> getAllArtists();

  /// Ranger les artistes par nom
  Stream<List<Artist>> sortByName();

  /// Obtenir la liste des candidats sélectionnés pour une compétition donnée
  Future<List<Artist>> getSelectedArtists(String competitionId);

  /// Obtenir les artistes triés par points TX pour une compétition donnée
  Future<List<Artist>> getArtistsSortedByPoints(String competitionId);

  /// Sauvegarder ou mettre à jour un artiste
  Future<void> saveArtist(Artist artist);

  /// Supprimer un artiste spécifique par son ID
  Future<void> deleteArtist(String artistId);
}