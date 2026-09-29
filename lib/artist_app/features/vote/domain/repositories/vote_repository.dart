import 'package:talent_x/artist_app/features/vote/domain/entities/vote.dart';

abstract class VoteRepository {
  Future<List<Candidate>> getCandidates();
  Future<bool> submitVote(String candidateId);
}
