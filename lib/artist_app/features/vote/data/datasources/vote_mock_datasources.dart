import '../../domain/entities/vote.dart';

class VoteMockDataSource {
  Future<List<Candidate>> fetchCandidates() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulation réseau
    return [
      const Candidate(id: '1', name: 'Aïsha Bamon', role: 'Chanteuse', imageUrl: 'https://placeholder.com'),
      const Candidate(id: '2', name: 'Nasser Gasino', role: 'Compositeur', imageUrl: 'https://placeholder.com'),
      const Candidate(id: '3', name: 'Ronée A.', role: 'Dessinatrice', imageUrl: 'https://placeholder.com'),
    ];
  }

  Future<bool> castVote(String candidateId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
