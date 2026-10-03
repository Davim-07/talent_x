import '../repositories/vote_repository.dart';

class SubmitVoteUseCase {
  final VoteRepository repository;

  SubmitVoteUseCase(this.repository);

  Future<bool> execute(String candidateId) async {
    return await repository.submitVote(candidateId);
  }
}
