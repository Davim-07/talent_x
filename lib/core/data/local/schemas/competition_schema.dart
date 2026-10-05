import 'package:isar/isar.dart';

part 'competition_schema.g.dart';

@collection
class CompetitionSchema {
  Id localId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String id;
  late String title;
  late String category;
  late String description;
  late String imageUrl;
  late String deadline;

  @Index()
  bool isSynced = false;
}
