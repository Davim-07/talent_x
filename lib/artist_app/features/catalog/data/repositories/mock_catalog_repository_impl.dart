import 'package:talent_x/artist_app/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:talent_x/artist_app/features/catalog/data/datasources/catalog_mock_datasource.dart';
import 'package:talent_x/artist_app/features/catalog/domain/entities/catalog_item.dart';

class MockCatalogRepository implements CatalogRepository {

  final List<FeaturedArtist> _artists =
      CatalogMockDataSource.getFeaturedArtists();

  final List<BannerEvent> _events = 
      CatalogMockDataSource.getBigEvent();



  @override
  List<FeaturedArtist> sortByName() {
    final list = List<FeaturedArtist>.from(_artists);
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
  }

  @override
  List<BannerEvent> sortByDate() {
    final list = List<BannerEvent>.from(_events);
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }
}
