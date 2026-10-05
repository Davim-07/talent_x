import '../models/vote_model.dart';

abstract class VoteDataSource {
  Future<List<CandidateModel>> fetchCandidates();
  Future<bool> sendVote(String candidateId);
}

class VoteMockDataSourceImpl implements VoteDataSource {
  @override
  Future<List<CandidateModel>> fetchCandidates() async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final List<Map<String, dynamic>> mockData = [
      {
        'id': '1',
        'name': 'Aïsha Bamon',
        'role': 'Chanteuse',
        'imageUrl': 'https://i.pravatar.cc/150?img=60',
      },
      {
        'id': '2',
        'name': 'Nasser Gasino',
        'role': 'Compositeur',
        'imageUrl': 'https://i.pravatar.cc/150?img=32',
      },
      {
        'id': '3',
        'name': 'Ronée A.',
        'role': 'Dessinatrice',
        'imageUrl': 'https://i.pravatar.cc/150?img=12',
      },
    ];

    return mockData.map((json) => CandidateModel.fromJson(json)).toList();
  }

  @override
  Future<bool> sendVote(String candidateId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return true; 
  }
}
