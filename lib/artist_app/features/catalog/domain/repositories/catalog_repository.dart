import 'package:talent_x/artist_app/features/catalog/domain/entities/catalog_item.dart';

abstract class CatalogRepository {
  List<FeaturedArtist> sortByName();

  List<BannerEvent> sortByDate();
}
