import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String email,
    required String fullName,
    required String country,
    required String province,
    required String district,
    required String artCategory, // 'danse', 'chant', 'dessin'
    required String role, // 'artist', 'jury', 'admin'
    @Default([]) List<String> medals,
    String? assignedCompetitionId, // Pour les membres du Jury
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
