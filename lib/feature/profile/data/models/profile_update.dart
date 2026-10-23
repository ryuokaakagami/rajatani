import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/user/enums/gender.dart';

part 'profile_update.freezed.dart';
part 'profile_update.g.dart';

@freezed
abstract class ProfileUpdate with _$ProfileUpdate {
  const new _();

  const factory ProfileUpdate({
    @JsonKey(includeIfNull: false) String? username,
    @JsonKey(includeIfNull: false) String? fullname,
    @JsonKey(includeIfNull: false) String? bio,
    @JsonKey(includeIfNull: false) Gender? gender,
    @JsonKey(includeIfNull: false) DateTime? birthday,
    @JsonKey(includeIfNull: false) String? avatarUrl,
  }) = _ProfileUpdate;

  factory ProfileUpdate.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateFromJson(json);
}
