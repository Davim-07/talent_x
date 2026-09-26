import 'package:talent_x/features/catalog/domain/entities/catalog_item.dart';

class CatalogMockDataSource {
  BannerEvent getBigEvent() {
    return BannerEvent(
      title: "Battle de Danse 2026",
      subtitle: "Soutenez le meilleur danseur local dès maintenant !",
      imageUrl: "https://images.unsplash.com/photo-1547153760-18fc86324498", // Image néon/danse
    );
  }

  List<FeaturedArtist> getFeaturedArtists() {
    return [
      FeaturedArtist(
        id: "1",
        name: "Akilah Semy",
        imageUrl: "https://i.pravatar.cc/150?img=32",
        category: "Chant",
      ),
      FeaturedArtist(
        id: "2",
        name: "Noor Graves",
        imageUrl: "https://i.pravatar.cc/150?img=12",
        category: "Danse",
      ),
      FeaturedArtist(
        id: "3",
        name: "Ramos E.",
        imageUrl: "https://i.pravatar.cc/150?img=60",
        category: "Dessin",
      ),
    ];
  }
}