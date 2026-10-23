import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/user/entities/user_entity.dart';
import '../../../domain/user/enums/gender.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const new _();

  const factory UserModel({
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
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
    id: id,
    username: username,
    fullname: fullname,
    email: email,
    phone: phone,
    bio: bio,
    avatarUrl: avatarUrl,
    gender: gender,
    birthday: birthday,
    rating: rating,
    totalReviews: totalReviews,
    updatedAt: updatedAt,
    createdAt: createdAt,
  );

  factory UserModel.fromEntity(UserEntity e) => UserModel(
    id: e.id,
    username: e.username,
    fullname: e.fullname,
    email: e.email,
    phone: e.phone,
    bio: e.bio,
    avatarUrl: e.avatarUrl,
    gender: e.gender,
    birthday: e.birthday,
    rating: e.rating,
    totalReviews: e.totalReviews,
    updatedAt: e.updatedAt,
    createdAt: e.createdAt,
  );
}
