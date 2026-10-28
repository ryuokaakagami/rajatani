import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/gender.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const new _();

  const factory UserEntity({
    required String id,
    String? username,
    String? fullname,
    String? email,
    String? phone,
    String? bio,
    String? avatarUrl,
    String? avatarPath,
    Gender? gender,
    DateTime? birthday,
    @Default(0.0) double rating,
    @Default(0) int totalReviews,
    DateTime? usernameUpdatedAt,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) = _UserEntity;
}
