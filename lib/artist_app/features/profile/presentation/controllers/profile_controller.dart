import 'package:flutter/material.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_profile_usecase.dart';
// CORRECTION : Cet import permet à Flutter de reconnaître ProfileRepositoryImpl
import '../../data/repositories/profile_repository_impl.dart';

class ProfileController extends ChangeNotifier {
  final ProfileRepositoryImpl _repository = ProfileRepositoryImpl();
  late final GetProfileUseCase _getProfileUseCase;

  ArtistProfile? profile;
  bool isLoading = false;

  ProfileController() {
    _getProfileUseCase = GetProfileUseCase(_repository);
    loadArtistProfile('aisha_b');
  }

  Future<void> loadArtistProfile(String artistId) async {
    isLoading = true;
    notifyListeners();
    try {
      profile = await _getProfileUseCase.execute(artistId);
    } catch (_) {}
    isLoading = false;
    notifyListeners();
  }
}
