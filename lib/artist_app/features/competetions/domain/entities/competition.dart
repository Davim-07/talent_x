class Competition {
  final String id;
  final String title;
  final String category; // Chant, Danse, Dessin, etc.
  final String description;
  final String imageUrl;
  final int participantsCount;
  final String prize;
  final String deadline;
  final double entryFee; // Frais d'entrée (en monnaie locale/jetons)

  Competition({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.participantsCount,
    required this.prize,
    required this.deadline,
    required this.entryFee,
  });
}