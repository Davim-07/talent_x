import 'package:talent_x/artist_app/features/competetions/domain/entities/competition.dart';

abstract class CompetitionRepository {
  Future<List<Competition>> getActiveCompetitions();
  Future<List<Competition>> getCompetitionsByCategory(String category);
}