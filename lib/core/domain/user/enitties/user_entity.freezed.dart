// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEntity {

 String get id; String? get username; String? get fullname; String? get email; String? get phone; String? get bio;@JsonKey(name: 'avatar_url') String? get avatarUrl; Gender? get gender; DateTime? get birthday; double get rating;@JsonKey(name: 'total_reviews') int get totalReviews;@JsonKey(name: 'last_active') DateTime? get lastActive;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);

  /// Serializes this UserEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.fullname, _this.fullname) || other.fullname == _this.fullname)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.bio, _this.bio) || other.bio == _this.bio)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.birthday, _this.birthday) || other.birthday == _this.birthday)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.totalReviews, _this.totalReviews) || other.totalReviews == _this.totalReviews)&&(identical(other.lastActive, _this.lastActive) || other.lastActive == _this.lastActive)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserEntity;
  return Object.hash(runtimeType,_this.id,_this.username,_this.fullname,_this.email,_this.phone,_this.bio,_this.avatarUrl,_this.gender,_this.birthday,_this.rating,_this.totalReviews,_this.lastActive,_this.updatedAt,_this.createdAt);
}

@override
String toString() {
  final _this = this as UserEntity;
  return 'UserEntity(id: ${_this.id}, username: ${_this.username}, fullname: ${_this.fullname}, email: ${_this.email}, phone: ${_this.phone}, bio: ${_this.bio}, avatarUrl: ${_this.avatarUrl}, gender: ${_this.gender}, birthday: ${_this.birthday}, rating: ${_this.rating}, totalReviews: ${_this.totalReviews}, lastActive: ${_this.lastActive}, updatedAt: ${_this.updatedAt}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String id, String? username, String? fullname, String? email, String? phone, String? bio,@JsonKey(name: 'avatar_url') String? avatarUrl, Gender? gender, DateTime? birthday, double rating,@JsonKey(name: 'total_reviews') int totalReviews,@JsonKey(name: 'last_active') DateTime? lastActive,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = freezed,Object? fullname = freezed,Object? email = freezed,Object? phone = freezed,Object? bio = freezed,Object? avatarUrl = freezed,Object? gender = freezed,Object? birthday = freezed,Object? rating = null,Object? totalReviews = null,Object? lastActive = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(UserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,lastActive: freezed == lastActive ? _self.lastActive : lastActive // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? username,  String? fullname,  String? email,  String? phone,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl,  Gender? gender,  DateTime? birthday,  double rating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'last_active')  DateTime? lastActive, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.username,_that.fullname,_that.email,_that.phone,_that.bio,_that.avatarUrl,_that.gender,_that.birthday,_that.rating,_that.totalReviews,_that.lastActive,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? username,  String? fullname,  String? email,  String? phone,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl,  Gender? gender,  DateTime? birthday,  double rating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'last_active')  DateTime? lastActive, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.username,_that.fullname,_that.email,_that.phone,_that.bio,_that.avatarUrl,_that.gender,_that.birthday,_that.rating,_that.totalReviews,_that.lastActive,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? username,  String? fullname,  String? email,  String? phone,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl,  Gender? gender,  DateTime? birthday,  double rating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'last_active')  DateTime? lastActive, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.username,_that.fullname,_that.email,_that.phone,_that.bio,_that.avatarUrl,_that.gender,_that.birthday,_that.rating,_that.totalReviews,_that.lastActive,_that.updatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEntity implements UserEntity {
  const _UserEntity({required this.id, this.username, this.fullname, this.email, this.phone, this.bio, @JsonKey(name: 'avatar_url') this.avatarUrl, this.gender, this.birthday, this.rating = 0.0, @JsonKey(name: 'total_reviews') this.totalReviews = 0, @JsonKey(name: 'last_active') this.lastActive, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

@override final  String id;
@override final  String? username;
@override final  String? fullname;
@override final  String? email;
@override final  String? phone;
@override final  String? bio;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override final  Gender? gender;
@override final  DateTime? birthday;
@override@JsonKey() final  double rating;
@override@JsonKey(name: 'total_reviews') final  int totalReviews;
@override@JsonKey(name: 'last_active') final  DateTime? lastActive;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.lastActive, lastActive) || other.lastActive == lastActive)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,username,fullname,email,phone,bio,avatarUrl,gender,birthday,rating,totalReviews,lastActive,updatedAt,createdAt);
}

@override
String toString() {
    return 'UserEntity(id: $id, username: $username, fullname: $fullname, email: $email, phone: $phone, bio: $bio, avatarUrl: $avatarUrl, gender: $gender, birthday: $birthday, rating: $rating, totalReviews: $totalReviews, lastActive: $lastActive, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? username, String? fullname, String? email, String? phone, String? bio,@JsonKey(name: 'avatar_url') String? avatarUrl, Gender? gender, DateTime? birthday, double rating,@JsonKey(name: 'total_reviews') int totalReviews,@JsonKey(name: 'last_active') DateTime? lastActive,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = freezed,Object? fullname = freezed,Object? email = freezed,Object? phone = freezed,Object? bio = freezed,Object? avatarUrl = freezed,Object? gender = freezed,Object? birthday = freezed,Object? rating = null,Object? totalReviews = null,Object? lastActive = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_UserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,lastActive: freezed == lastActive ? _self.lastActive : lastActive // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
