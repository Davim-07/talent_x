import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<ArtistProfile> getProfile(String artistId);
}
