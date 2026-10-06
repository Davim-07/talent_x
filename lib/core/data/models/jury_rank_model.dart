import 'package:talent_x/core/data/local/schemas/jury_rank_schema.dart';
import 'package:talent_x/core/domain/entities/jury_rank.dart';

class JuryRankModel extends JuryRank {
  JuryRankModel({
    required super.juryId,
    required super.artistId,
    required super.competitionId,
    required super.rank,
  });

  factory JuryRankModel.fromFirestore(Map<String, dynamic> json, String docId) {
    return JuryRankModel(
      juryId: (json['juryId'] as String?) ?? '',
      artistId: (json['artistId'] as String?) ?? (json['artistid'] as String?) ?? '',
      competitionId: (json['competitionId'] as String?) ?? '',
      rank: (json['rank'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'juryId': juryId,
      'artistId': artistId,
      'competitionId': competitionId,
      'rank': rank,
    };
  }

  JuryRankSchema toSchema({bool isSynced = false}) {
    return JuryRankSchema()
      ..juryId = juryId
      ..artistId = artistId
      ..competitionId = competitionId
      ..rank = rank
      ..isSynced = isSynced;
  }

  factory JuryRankModel.fromSchema(JuryRankSchema schema) {
    return JuryRankModel(
      juryId: schema.juryId,
      artistId: schema.artistId,
      competitionId: schema.competitionId,
      rank: schema.rank,
    );
  }
}
