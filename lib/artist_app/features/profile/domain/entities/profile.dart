class ArtistProfile {
  final String id;
  final String name;
  final String role;
  final String avatarUrl;
  final String followersCount;
  final String votesCount;
  final int performancesCount;
  final String biography;
  final List<String> galleryUrls;

  ArtistProfile({
    required this.id,
    required this.name,
    required this.role,
    required this.avatarUrl,
    required this.followersCount,
    required this.votesCount,
    required this.performancesCount,
    required this.biography,
    required this.galleryUrls,
  });
}
