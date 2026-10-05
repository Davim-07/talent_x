import 'package:isar/isar.dart';

part 'vote_schema.g.dart';

@collection
class VoteSchema {
  Id localId = Isar.autoIncrement; // Clé primaire locale Isar

  @Index(unique: true, replace: true)
  late String id; // ID Firestore ou ID unique temporaire local

  late String artistId;
  late String competitionId;
  late String voterId;
  int txPoints = 2;
  late DateTime createdAt;

  @Index()
  bool isSynced = false; // Flag crucial pour l'offline-first !
}