// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vote _$VoteFromJson(Map<String, dynamic> json) => _Vote(
  id: json['id'] as String,
  competitionId: json['competitionId'] as String,
  voterId: json['voterId'] as String,
  targetEntryId: json['targetEntryId'] as String,
  txPoints: (json['txPoints'] as num?)?.toInt() ?? 2,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$VoteToJson(_Vote instance) => <String, dynamic>{
  'id': instance.id,
  'competitionId': instance.competitionId,
  'voterId': instance.voterId,
  'targetEntryId': instance.targetEntryId,
  'txPoints': instance.txPoints,
  'createdAt': instance.createdAt.toIso8601String(),
};
