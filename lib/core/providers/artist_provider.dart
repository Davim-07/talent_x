import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/data/repositories/artist_repository_impl.dart';
import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/domain/repositorires/artist_repository.dart';
import 'core_providers.dart';

/// Provider du repository des artistes
final artistRepositoryProvider = Provider<ArtistRepository>((ref) {
  final localDS = ref.watch(localDataSourceProvider);
  final remoteDS = ref.watch(remoteDataSourceProvider);
  return ArtistRepositoryImpl(localDS: localDS, remoteDS: remoteDS);
});

/// Stream de tous les artistes (Isar temps réel + Sync Firestore)
final allArtistsStreamProvider = StreamProvider<List<Artist>>((ref) {
  final repo = ref.watch(artistRepositoryProvider);
  return repo.getAllArtists();
});

/// Stream des artistes triés par nom alphabétique
final artistsSortedByNameStreamProvider = StreamProvider<List<Artist>>((ref) {
  final repo = ref.watch(artistRepositoryProvider);
  return repo.sortByName();
});

/// Artistes sélectionnés pour une compétition spécifique
final selectedArtistsProvider =
    FutureProvider.family<List<Artist>, String>((ref, competitionId) {
  final repo = ref.watch(artistRepositoryProvider);
  return repo.getSelectedArtists(competitionId);
});

/// Artistes triés par points TX accumulés dans une compétition
final artistsSortedByPointsProvider =
    FutureProvider.family<List<Artist>, String>((ref, competitionId) {
  final repo = ref.watch(artistRepositoryProvider);
  return repo.getArtistsSortedByPoints(competitionId);
});
