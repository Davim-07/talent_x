import 'package:isar/isar.dart';

part 'jury_rank_schema.g.dart';

@collection
class JuryRankSchema {
  Id localId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String id;
  late String juryId;
  late String artistId;
  late String competitionId;
  late int rank;

  @Index()
  bool isSynced = false;
}
