import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/user/enums/gender.dart';

part 'profile_update.freezed.dart';
part 'profile_update.g.dart';

String? _dateOnly(DateTime? date) =>
    date == null ? null : DateFormat('yyyy-MM-dd').format(date);

@freezed
abstract class ProfileUpdate with _$ProfileUpdate {
  const new _();

  const factory ProfileUpdate({
    @JsonKey(includeIfNull: false) String? username,
    @JsonKey(includeIfNull: false) String? fullname,
    @JsonKey(includeIfNull: false) String? bio,
    @JsonKey(includeIfNull: false) Gender? gender,
    @JsonKey(includeIfNull: false, toJson: _dateOnly) DateTime? birthday,
  }) = _ProfileUpdate;

  factory ProfileUpdate.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateFromJson(json);
}
