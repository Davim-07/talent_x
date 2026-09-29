import '../../domain/entities/vote.dart';
import '../../domain/repositories/vote_repository.dart';
import '../datasources/vote_mock_datasources.dart';

class VoteRepositoryImpl implements VoteRepository {
  final VoteDataSource dataSource = VoteMockDataSourceImpl();

  @override
  Future<List<Candidate>> getCandidates() async {
    return await dataSource.fetchCandidates();
  }

  @override
  Future<bool> submitVote(String candidateId) async {
    return await dataSource.sendVote(candidateId);
  }
}
