class BigEvent {
  final String title;
  final String subtitle;
  final String imageUrl;
  final DateTime createdAt;

  BigEvent({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    DateTime? createdAt
  }): createdAt = createdAt??  DateTime.now();
}