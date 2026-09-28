import 'package:talent_x/features/catalog/domain/entities/catalog_item.dart';

abstract class CatalogRepository {
  List<FeaturedArtist> sortByName();

  List<BannerEvent> sortByDate();
}
