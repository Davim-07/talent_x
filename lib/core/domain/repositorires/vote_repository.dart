import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/domain/entities/jury_rank.dart';
import 'package:talent_x/core/domain/entities/vote.dart';

abstract class VoteRepository {
  Future<void> castVote({required String artistId, required String competitionId}); //l'artiste ou le public vote

  Future<void> setMyRank({required String artistId,required String competitionId, required int rank});

  Stream<List<Vote>>
  getVotesForArtist(); // le jury ou tout le monde regarde en direct

  Stream<List<Vote>> getVotesForCompetition(String competitionId);

  
  Stream<List<JuryRank>> getAllJuryRanks(String competitionId);

  Stream<List<Artist>> getFinalTop10(String competitionId); //moyenne des 4 jurys

  Future<bool> hasAlreadyVoted({
    required String artistId,
    required String competitionId,
  });
}
