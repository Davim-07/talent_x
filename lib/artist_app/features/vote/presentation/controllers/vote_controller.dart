import 'package:flutter/material.dart';
import '../../domain/entities/vote.dart';
import '../../domain/usecases/submit_vote_usecase.dart';
import '../../data/repositories/vote_repository_impl.dart';

class VoteController extends ChangeNotifier {
  final VoteRepositoryImpl _repository = VoteRepositoryImpl();
  late final SubmitVoteUseCase _submitVoteUseCase;

  List<Candidate> candidates = [];
  String? selectedCandidateId;
  bool isLoading = false;

  VoteController() {
    _submitVoteUseCase = SubmitVoteUseCase(_repository);
    _loadCandidates();
  }

  Future<void> _loadCandidates() async {
    isLoading = true;
    notifyListeners();
    candidates = await _repository.getCandidates();
    isLoading = false;
    notifyListeners();
  }

  void selectCandidate(String candidateId) {
    selectedCandidateId = candidateId;
    notifyListeners();
  }

  Future<bool> confirmVote() async {
    if (selectedCandidateId == null) return false;
    
    isLoading = true;
    notifyListeners();
    
    final success = await _submitVoteUseCase.execute(selectedCandidateId!);
    
    isLoading = false;
    notifyListeners();
    return success;
  }
}
