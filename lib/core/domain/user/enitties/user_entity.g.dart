// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: json['id'] as String,
  username: json['username'] as String?,
  fullname: json['fullname'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  bio: json['bio'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
  birthday: json['birthday'] == null
      ? null
      : DateTime.parse(json['birthday'] as String),
  rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  totalReviews: (json['total_reviews'] as num?)?.toInt() ?? 0,
  lastActive: json['last_active'] == null
      ? null
      : DateTime.parse(json['last_active'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
      'bio': instance.bio,
      'avatar_url': instance.avatarUrl,
      'gender': _$GenderEnumMap[instance.gender],
      'birthday': instance.birthday?.toIso8601String(),
      'rating': instance.rating,
      'total_reviews': instance.totalReviews,
      'last_active': instance.lastActive?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.notToSay: 'notToSay',
};
