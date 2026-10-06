// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompetitionImpl _$$CompetitionImplFromJson(Map<String, dynamic> json) =>
    _$CompetitionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      isBigEvent: json['isBigEvent'] as bool,
      status: json['status'] as String,
      entryDeadline: DateTime.parse(json['entryDeadline'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$CompetitionImplToJson(_$CompetitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'category': instance.category,
      'isBigEvent': instance.isBigEvent,
      'status': instance.status,
      'entryDeadline': instance.entryDeadline.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
