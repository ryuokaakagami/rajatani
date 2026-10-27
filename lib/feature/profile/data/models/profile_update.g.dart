// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileUpdate _$ProfileUpdateFromJson(Map<String, dynamic> json) =>
    _ProfileUpdate(
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      bio: json['bio'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
    );

Map<String, dynamic> _$ProfileUpdateToJson(_ProfileUpdate instance) =>
    <String, dynamic>{
      'username': ?instance.username,
      'fullname': ?instance.fullname,
      'bio': ?instance.bio,
      'gender': ?_$GenderEnumMap[instance.gender],
      'birthday': ?_dateOnly(instance.birthday),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.notToSay: 'not_to_say',
};
