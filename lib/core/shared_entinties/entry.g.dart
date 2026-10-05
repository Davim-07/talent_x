// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Entry _$EntryFromJson(Map<String, dynamic> json) => _Entry(
  id: json['id'] as String,
  competitionId: json['competitionId'] as String,
  artistId: json['artistId'] as String,
  mediaUrl: json['mediaUrl'] as String,
  isAnonymous: json['isAnonymous'] as bool? ?? true,
  aiFlagged: json['aiFlagged'] as bool? ?? false,
  artistVotesCount: (json['artistVotesCount'] as num?)?.toInt() ?? 0,
  juryScore: (json['juryScore'] as num?)?.toDouble(),
);

Map<String, dynamic> _$EntryToJson(_Entry instance) => <String, dynamic>{
  'id': instance.id,
  'competitionId': instance.competitionId,
  'artistId': instance.artistId,
  'mediaUrl': instance.mediaUrl,
  'isAnonymous': instance.isAnonymous,
  'aiFlagged': instance.aiFlagged,
  'artistVotesCount': instance.artistVotesCount,
  'juryScore': instance.juryScore,
};
