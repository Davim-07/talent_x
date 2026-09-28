import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/features/catalog/data/repositories/mock_catalog_repository_impl.dart';
import 'package:talent_x/features/catalog/domain/entities/catalog_item.dart';
import 'package:talent_x/features/catalog/domain/repositories/catalog_repository.dart';

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  return MockCatalogRepository();
});

final sortEventsProvider = Provider<List<BannerEvent>>((ref) {
  final repository = ref.watch(catalogRepositoryProvider);
  return repository.sortByDate();
});
