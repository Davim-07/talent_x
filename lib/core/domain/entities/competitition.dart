class Competition {
  final String id;
  final String title;
  final String category; // Chant, Danse, Dessin, etc.
  final String description;
  final String imageUrl;
  final String deadline;
  
  Competition({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.deadline,
  });
}