class JuryRank {
  final String juryId;
  final String artistId;
  final String competitionId;
  final int rank; //top 10 ou top 20 ou top 30

  JuryRank({
    required this.juryId,
    required this.artistId,
    required this.competitionId,
    required this.rank,
  });
}
