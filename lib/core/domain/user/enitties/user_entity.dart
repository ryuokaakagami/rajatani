import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/user/enums/gender.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    String? username,
    String? fullname,
    String? email,
    String? phone,
    String? bio,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    Gender? gender,
    DateTime? birthday,
    @Default(0.0) double rating,
    @JsonKey(name: 'total_reviews') @Default(0) int totalReviews,
    @JsonKey(name: 'last_active') DateTime? lastActive,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
