import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/data/repositories/big_event_repository_impl.dart';
import 'package:talent_x/core/domain/entities/big_event.dart';
import 'package:talent_x/core/domain/repositorires/big_event_repository.dart';
import 'core_providers.dart';

/// Provider du repository des grands événements
final bigEventRepositoryProvider = Provider<BigEventRepository>((ref) {
  final localDS = ref.watch(localDataSourceProvider);
  final remoteDS = ref.watch(remoteDataSourceProvider);
  return BigEventRepositoryImpl(localDS: localDS, remoteDS: remoteDS);
});

/// Stream de tous les grands événements
final allBigEventsStreamProvider = StreamProvider<List<BigEvent>>((ref) {
  final repo = ref.watch(bigEventRepositoryProvider);
  return repo.getAllBigEvents();
});

/// Stream des événements du plus récent au plus ancien
final latestBigEventsStreamProvider = StreamProvider<List<BigEvent>>((ref) {
  final repo = ref.watch(bigEventRepositoryProvider);
  return repo.getLatestBigEvents();
});

/// Recherche d'un événement par titre
final searchBigEventProvider =
    FutureProvider.family<BigEvent?, String>((ref, title) {
  final repo = ref.watch(bigEventRepositoryProvider);
  return repo.searchBigEvent(title);
});
