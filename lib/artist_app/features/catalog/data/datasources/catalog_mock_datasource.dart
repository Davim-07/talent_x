import 'package:talent_x/artist_app/features/catalog/domain/entities/catalog_item.dart';

class CatalogMockDataSource {

   static List<BannerEvent> getBigEvent() {
    return [
      BannerEvent(
        title: "Event 1",
        subtitle: "Concert",
        imageUrl: "https://images.unsplash.com/photo-1547153760-18fc86324498",
        createdAt: DateTime(2024, 1, 10)
      ),
      BannerEvent(
      title: "Battle de Danse 2026",
      subtitle: "Soutenez le meilleur danseur local dès maintenant !",
      imageUrl: "https://images.unsplash.com/photo-1547153760-18fc86324498", // Image néon/danse
      ),
    ];
  }

  static List<FeaturedArtist> getFeaturedArtists() {
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