import '../entities/vote.dart';

abstract class VoteRepository {
  Future<List<Candidate>> getCandidates();
  Future<bool> submitVote(String candidateId);
}
