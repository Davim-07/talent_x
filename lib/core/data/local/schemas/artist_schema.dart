import 'package:isar/isar.dart';

part 'artist_schema.g.dart';

@collection
class ArtistSchema {
  Id localId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String id;
  late String name;
  late String imageUrl;
  late String category;

  @Index()
  bool isSynced = false;
}
