// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteImpl _$$VoteImplFromJson(Map<String, dynamic> json) => _$VoteImpl(
      id: json['id'] as String,
      competitionId: json['competitionId'] as String,
      voterId: json['voterId'] as String,
      targetEntryId: json['targetEntryId'] as String,
      txPoints: (json['txPoints'] as num?)?.toInt() ?? 2,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$VoteImplToJson(_$VoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'competitionId': instance.competitionId,
      'voterId': instance.voterId,
      'targetEntryId': instance.targetEntryId,
      'txPoints': instance.txPoints,
      'createdAt': instance.createdAt.toIso8601String(),
    };
