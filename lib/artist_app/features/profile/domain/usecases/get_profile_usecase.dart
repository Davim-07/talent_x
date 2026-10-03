import '../repositories/profile_repository.dart';
import '../entities/profile.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<ArtistProfile> execute(String artistId) async {
    return await repository.getProfile(artistId);
  }
}
