import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/vote.dart';
import '../local/schemas/vote_schema.dart';

class VoteModel extends Vote {
  VoteModel({
    required super.id,
    required super.artistId,
    required super.competitionId,
    required super.voterId,
    super.txPoints = 2,
    required super.createdAt,
  });

  // 1. Depuis Firestore -> VoteModel
  factory VoteModel.fromFirestore(Map<String, dynamic> json, String docId) {
    DateTime parsedDate;
    if (json['createdAt'] is Timestamp) {
      parsedDate = (json['createdAt'] as Timestamp).toDate();
    } else if (json['createdAt'] is String) {
      parsedDate = DateTime.tryParse(json['createdAt'] as String) ?? DateTime.now();
    } else {
      parsedDate = DateTime.now();
    }

    return VoteModel(
      id: (json['id'] as String?) ?? docId,
      artistId: (json['artistId'] as String?) ?? '',
      competitionId: (json['competitionId'] as String?) ?? '',
      voterId: (json['voterId'] as String?) ?? '',
      txPoints: (json['txPoints'] as int?) ?? 2,
      createdAt: parsedDate,
    );
  }

  // 2. Depuis Schéma Isar -> VoteModel
  factory VoteModel.fromSchema(VoteSchema schema) {
    return VoteModel(
      id: schema.id,
      artistId: schema.artistId,
      competitionId: schema.competitionId,
      voterId: schema.voterId,
      txPoints: schema.txPoints,
      createdAt: schema.createdAt,
    );
  }

  // 3. VoteModel -> Map Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'artistId': artistId,
      'competitionId': competitionId,
      'voterId': voterId,
      'txPoints': txPoints,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  // 4. VoteModel -> Schéma Isar
  VoteSchema toSchema({bool isSynced = false}) {
    return VoteSchema()
      ..id = id
      ..artistId = artistId
      ..competitionId = competitionId
      ..voterId = voterId
      ..txPoints = txPoints
      ..createdAt = createdAt
      ..isSynced = isSynced;
  }
}