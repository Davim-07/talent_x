import 'package:flutter/material.dart';
import '../../domain/entities/vote.dart';
import '../../data/repositories/vote_repository_impl.dart';
import 'package:talent_x/artist_app/features/vote/data/datasources/vote_mock_datasources.dart';

class VoteController extends ChangeNotifier {
  final VoteRepositoryImpl _repository = VoteRepositoryImpl(VoteMockDataSource());

  List<Candidate> candidates = [];
  bool isLoading = false;

  Future<void> loadCandidates() async {
    isLoading = true;
    notifyListeners();
    candidates = await _repository.getCandidates();
    isLoading = false;
    notifyListeners();
  }

  Future<void> voteForCandidate(String id) async {
    final success = await _repository.submitVote(id);
    if (success) {
      // Gérer le retour visuel ici (ex: pop-up de succès)
    }
  }
}
