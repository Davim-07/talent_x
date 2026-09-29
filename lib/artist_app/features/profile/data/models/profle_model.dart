import '../../domain/entities/profile.dart';

class ProfileModel extends ArtistProfile {
  ProfileModel({
    required super.id,
    required super.name,
    required super.role,
    required super.avatarUrl,
    required super.followersCount,
    required super.votesCount,
    required super.performancesCount,
    required super.biography,
    required super.galleryUrls,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      avatarUrl: json['avatarUrl'] as String? ?? '',
      followersCount: json['followersCount'] as String,
      votesCount: json['votesCount'] as String,
      performancesCount: json['performancesCount'] as int,
      biography: json['biography'] as String,
      galleryUrls: List<String>.from(json['galleryUrls'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'avatarUrl': avatarUrl,
      'followersCount': followersCount,
      'votesCount': votesCount,
      'performancesCount': performancesCount,
      'biography': biography,
      'galleryUrls': galleryUrls,
    };
  }
}
