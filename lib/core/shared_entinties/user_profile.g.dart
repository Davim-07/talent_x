// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      country: json['country'] as String,
      province: json['province'] as String,
      district: json['district'] as String,
      artCategory: json['artCategory'] as String,
      role: json['role'] as String,
      medals: (json['medals'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      assignedCompetitionId: json['assignedCompetitionId'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'fullName': instance.fullName,
      'country': instance.country,
      'province': instance.province,
      'district': instance.district,
      'artCategory': instance.artCategory,
      'role': instance.role,
      'medals': instance.medals,
      'assignedCompetitionId': instance.assignedCompetitionId,
    };
