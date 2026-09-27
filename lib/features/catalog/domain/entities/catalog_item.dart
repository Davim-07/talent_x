class FeaturedArtist {
  final String id;
  final String name;
  final String imageUrl;
  final String category;

  FeaturedArtist({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
  });
}

class BannerEvent {
  final String title;
  final String subtitle;
  final String imageUrl;
  final DateTime createdAt;

  BannerEvent({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    DateTime? createdAt
  }): createdAt = createdAt??  DateTime.now();
}
