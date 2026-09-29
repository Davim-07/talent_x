import '../entities/competition.dart';

abstract class CompetitionRepository {
  Future<List<Competition>> getActiveCompetitions();
  Future<List<Competition>> getCompetitionsByCategory(String category);
}