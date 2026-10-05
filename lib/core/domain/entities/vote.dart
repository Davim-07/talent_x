class Vote {
  final String id;
  final String artistId;
  final String competitionId;
  final String voterId;
  final int txPoints;
  final DateTime createdAt;

  Vote({
    required this.id,
    required this.artistId,
    required this.competitionId,
    required this.voterId,
    this.txPoints = 2,
    required this.createdAt,
  });
}
