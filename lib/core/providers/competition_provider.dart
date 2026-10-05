import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/data/repositories/competition_repository_impl.dart';
import 'package:talent_x/core/domain/entities/competitition.dart';
import 'package:talent_x/core/domain/repositorires/competition_repository.dart';
import 'core_providers.dart';

/// Provider du repository des compétitions
final competitionRepositoryProvider = Provider<CompetitionRepository>((ref) {
  final localDS = ref.watch(localDataSourceProvider);
  final remoteDS = ref.watch(remoteDataSourceProvider);
  return CompetitionRepositoryImpl(localDS: localDS, remoteDS: remoteDS);
});

/// Stream de toutes les compétitions (Isar en temps réel + Sync Firestore)
final allCompetitionsStreamProvider = StreamProvider<List<Competition>>((ref) {
  final repo = ref.watch(competitionRepositoryProvider);
  return repo.getAllCompetitions();
});

/// Stream des compétitions actuellement actives
final activeCompetitionsStreamProvider = StreamProvider<List<Competition>>((ref) {
  final repo = ref.watch(competitionRepositoryProvider);
  return repo.getActiveCompetitions();
});

/// FutureProvider pour filtrer les compétitions par catégorie
final competitionsByCategoryProvider =
    FutureProvider.family<List<Competition>, String>((ref, category) {
  final repo = ref.watch(competitionRepositoryProvider);
  return repo.getCompetitionByCategory(category);
});
