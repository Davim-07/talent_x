import 'package:isar/isar.dart';

part 'big_event_schema.g.dart';

@collection
class BigEventSchema {
  Id localId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String title;
  late String subtitle;
  late String imageUrl;

  @Index()
  bool isSynced = false;
}
