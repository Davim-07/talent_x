import 'package:talent_x/core/domain/entities/competitition.dart';

abstract class CompetitionRepository {
  Stream<List<Competition>> getAllCompetitions(); //lister toutes les competitions

  Stream<List<Competition>> getActiveCompetitions(); //lister les competitions ayant des participants

  Future<List<Competition>> getCompetitionByCategory(String category); //ranger les competitions par categorie

  List<Competition> sortByDate(); //ranger les competitions par date

  Competition searchCompetition(); //rechercher une competition - requete Read

  Future<void> deleteCompetition(); //supprimer une competition -requete Delete
}
