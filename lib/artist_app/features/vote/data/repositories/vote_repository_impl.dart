import '../../domain/entities/vote.dart';
import '../../domain/repositories/vote_repository.dart';
import 'package:talent_x/artist_app/features/vote/data/datasources/vote_mock_datasources.dart';

class VoteRepositoryImpl implements VoteRepository {
  final VoteMockDataSource dataSource;

  VoteRepositoryImpl(this.dataSource);

  @override
  Future<List<Candidate>> getCandidates() async {
    return await dataSource.fetchCandidates();
  }

  @override
  Future<bool> submitVote(String candidateId) async {
    return await dataSource.castVote(candidateId);
  }
}
