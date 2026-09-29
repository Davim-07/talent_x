import 'package:talent_x/artist_app/features/profile/data/models/profle_model.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> fetchProfile(String artistId);
}

class ProfileMockDataSourceImpl implements ProfileDataSource {
  @override
  Future<ProfileModel> fetchProfile(String artistId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return ProfileModel(
      id: artistId,
      name: 'Aisha B.',
      role: 'Chanteuse et performeuse',
      avatarUrl: 'https://pravatar.cc',
      followersCount: '12,5K',
      votesCount: '48K',
      performancesCount: 12,
      biography: 'Aisha B. est une chanteuse et performeuse passionnée. Elle partage sa musique et ses prestations sur scène avec sa communauté...',
      galleryUrls: [
        'https://unsplash.com',
        'https://unsplash.com',
        'https://unsplash.com',
      ],
    );
  }
}
