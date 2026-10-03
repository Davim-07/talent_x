import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_mock_datasources.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  // Instance de votre source de données simulée pour le profil
  final ProfileDataSource dataSource = ProfileMockDataSourceImpl();

  @override
  Future<ArtistProfile> getProfile(String artistId) async {
    // Récupère les données brutes du mock et les renvoie au UseCase
    return await dataSource.fetchProfile(artistId);
  }
}
