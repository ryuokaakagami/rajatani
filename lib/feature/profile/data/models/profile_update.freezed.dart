// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileUpdate {

@JsonKey(includeIfNull: false) String? get username;@JsonKey(includeIfNull: false) String? get fullname;@JsonKey(includeIfNull: false) String? get bio;@JsonKey(includeIfNull: false) Gender? get gender;@JsonKey(includeIfNull: false) DateTime? get birthday;@JsonKey(includeIfNull: false) String? get avatarUrl;
/// Create a copy of ProfileUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUpdateCopyWith<ProfileUpdate> get copyWith => _$ProfileUpdateCopyWithImpl<ProfileUpdate>(this as ProfileUpdate, _$identity);

  /// Serializes this ProfileUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileUpdate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUpdate&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.fullname, _this.fullname) || other.fullname == _this.fullname)&&(identical(other.bio, _this.bio) || other.bio == _this.bio)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.birthday, _this.birthday) || other.birthday == _this.birthday)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileUpdate;
  return Object.hash(runtimeType,_this.username,_this.fullname,_this.bio,_this.gender,_this.birthday,_this.avatarUrl);
}

@override
String toString() {
  final _this = this as ProfileUpdate;
  return 'ProfileUpdate(username: ${_this.username}, fullname: ${_this.fullname}, bio: ${_this.bio}, gender: ${_this.gender}, birthday: ${_this.birthday}, avatarUrl: ${_this.avatarUrl})';
}


}

/// @nodoc
abstract mixin class $ProfileUpdateCopyWith<$Res>  {
  factory $ProfileUpdateCopyWith(ProfileUpdate value, $Res Function(ProfileUpdate) _then) = _$ProfileUpdateCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? username,@JsonKey(includeIfNull: false) String? fullname,@JsonKey(includeIfNull: false) String? bio,@JsonKey(includeIfNull: false) Gender? gender,@JsonKey(includeIfNull: false) DateTime? birthday,@JsonKey(includeIfNull: false) String? avatarUrl
});




}
/// @nodoc
class _$ProfileUpdateCopyWithImpl<$Res>
    implements $ProfileUpdateCopyWith<$Res> {
  _$ProfileUpdateCopyWithImpl(this._self, this._then);

  final ProfileUpdate _self;
  final $Res Function(ProfileUpdate) _then;

/// Create a copy of ProfileUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? fullname = freezed,Object? bio = freezed,Object? gender = freezed,Object? birthday = freezed,Object? avatarUrl = freezed,}) {
  return _then(ProfileUpdate(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileUpdate].
extension ProfileUpdatePatterns on ProfileUpdate {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileUpdate() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileUpdate value)  $default,){
final _that = this;
switch (_that) {
case _ProfileUpdate():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileUpdate() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? fullname, @JsonKey(includeIfNull: false)  String? bio, @JsonKey(includeIfNull: false)  Gender? gender, @JsonKey(includeIfNull: false)  DateTime? birthday, @JsonKey(includeIfNull: false)  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileUpdate() when $default != null:
return $default(_that.username,_that.fullname,_that.bio,_that.gender,_that.birthday,_that.avatarUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? fullname, @JsonKey(includeIfNull: false)  String? bio, @JsonKey(includeIfNull: false)  Gender? gender, @JsonKey(includeIfNull: false)  DateTime? birthday, @JsonKey(includeIfNull: false)  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ProfileUpdate():
return $default(_that.username,_that.fullname,_that.bio,_that.gender,_that.birthday,_that.avatarUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? fullname, @JsonKey(includeIfNull: false)  String? bio, @JsonKey(includeIfNull: false)  Gender? gender, @JsonKey(includeIfNull: false)  DateTime? birthday, @JsonKey(includeIfNull: false)  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ProfileUpdate() when $default != null:
return $default(_that.username,_that.fullname,_that.bio,_that.gender,_that.birthday,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileUpdate extends ProfileUpdate {
  const _ProfileUpdate({@JsonKey(includeIfNull: false) this.username, @JsonKey(includeIfNull: false) this.fullname, @JsonKey(includeIfNull: false) this.bio, @JsonKey(includeIfNull: false) this.gender, @JsonKey(includeIfNull: false) this.birthday, @JsonKey(includeIfNull: false) this.avatarUrl}): super._();
  factory _ProfileUpdate.fromJson(Map<String, dynamic> json) => _$ProfileUpdateFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? username;
@override@JsonKey(includeIfNull: false) final  String? fullname;
@override@JsonKey(includeIfNull: false) final  String? bio;
@override@JsonKey(includeIfNull: false) final  Gender? gender;
@override@JsonKey(includeIfNull: false) final  DateTime? birthday;
@override@JsonKey(includeIfNull: false) final  String? avatarUrl;

/// Create a copy of ProfileUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUpdateCopyWith<_ProfileUpdate> get copyWith => __$ProfileUpdateCopyWithImpl<_ProfileUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUpdate&&(identical(other.username, username) || other.username == username)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,username,fullname,bio,gender,birthday,avatarUrl);
}

@override
String toString() {
    return 'ProfileUpdate(username: $username, fullname: $fullname, bio: $bio, gender: $gender, birthday: $birthday, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ProfileUpdateCopyWith<$Res> implements $ProfileUpdateCopyWith<$Res> {
  factory _$ProfileUpdateCopyWith(_ProfileUpdate value, $Res Function(_ProfileUpdate) _then) = __$ProfileUpdateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? username,@JsonKey(includeIfNull: false) String? fullname,@JsonKey(includeIfNull: false) String? bio,@JsonKey(includeIfNull: false) Gender? gender,@JsonKey(includeIfNull: false) DateTime? birthday,@JsonKey(includeIfNull: false) String? avatarUrl
});




}
/// @nodoc
class __$ProfileUpdateCopyWithImpl<$Res>
    implements _$ProfileUpdateCopyWith<$Res> {
  __$ProfileUpdateCopyWithImpl(this._self, this._then);

  final _ProfileUpdate _self;
  final $Res Function(_ProfileUpdate) _then;

/// Create a copy of ProfileUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? fullname = freezed,Object? bio = freezed,Object? gender = freezed,Object? birthday = freezed,Object? avatarUrl = freezed,}) {
  return _then(_ProfileUpdate(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
