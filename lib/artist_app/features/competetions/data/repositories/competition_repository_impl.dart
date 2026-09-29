
import 'package:talent_x/artist_app/features/competetions/domain/entities/competition.dart';
import 'package:talent_x/artist_app/features/competetions/domain/repositories/competition_repository.dart';
import 'package:talent_x/artist_app/features/competetions/data/datasources/competition_mock_datasources.dart'; // 👈 Import absolu

class CompetitionRepositoryImpl implements CompetitionRepository {
  final CompetitionMockDataSource dataSource;

  CompetitionRepositoryImpl({required this.dataSource});

  @override
  Future<List<Competition>> getActiveCompetitions() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return dataSource.getActiveCompetitions();
  }

  @override
  Future<List<Competition>> getCompetitionsByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final all = dataSource.getActiveCompetitions();
    if (category == "Tous") return all;
    return all.where((comp) => comp.category.toLowerCase() == category.toLowerCase()).toList();
  }
}