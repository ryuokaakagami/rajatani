// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get id; String? get username; String? get fullname; String? get email; String? get phone; String? get bio;@JsonKey(name: 'avatar_url') String? get avatarUrl; Gender? get gender; DateTime? get birthday; double get rating;@JsonKey(name: 'total_reviews') int get totalReviews;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'username_updated_at') DateTime? get usernameUpdatedAt;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.fullname, _this.fullname) || other.fullname == _this.fullname)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.bio, _this.bio) || other.bio == _this.bio)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.birthday, _this.birthday) || other.birthday == _this.birthday)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.totalReviews, _this.totalReviews) || other.totalReviews == _this.totalReviews)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.usernameUpdatedAt, _this.usernameUpdatedAt) || other.usernameUpdatedAt == _this.usernameUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserModel;
  return Object.hash(runtimeType,_this.id,_this.username,_this.fullname,_this.email,_this.phone,_this.bio,_this.avatarUrl,_this.gender,_this.birthday,_this.rating,_this.totalReviews,_this.updatedAt,_this.createdAt,_this.usernameUpdatedAt);
}

@override
String toString() {
  final _this = this as UserModel;
  return 'UserModel(id: ${_this.id}, username: ${_this.username}, fullname: ${_this.fullname}, email: ${_this.email}, phone: ${_this.phone}, bio: ${_this.bio}, avatarUrl: ${_this.avatarUrl}, gender: ${_this.gender}, birthday: ${_this.birthday}, rating: ${_this.rating}, totalReviews: ${_this.totalReviews}, updatedAt: ${_this.updatedAt}, createdAt: ${_this.createdAt}, usernameUpdatedAt: ${_this.usernameUpdatedAt})';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String? username, String? fullname, String? email, String? phone, String? bio,@JsonKey(name: 'avatar_url') String? avatarUrl, Gender? gender, DateTime? birthday, double rating,@JsonKey(name: 'total_reviews') int totalReviews,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'username_updated_at') DateTime? usernameUpdatedAt
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = freezed,Object? fullname = freezed,Object? email = freezed,Object? phone = freezed,Object? bio = freezed,Object? avatarUrl = freezed,Object? gender = freezed,Object? birthday = freezed,Object? rating = null,Object? totalReviews = null,Object? updatedAt = freezed,Object? createdAt = freezed,Object? usernameUpdatedAt = freezed,}) {
  return _then(UserModel(
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
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,usernameUpdatedAt: freezed == usernameUpdatedAt ? _self.usernameUpdatedAt : usernameUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? username,  String? fullname,  String? email,  String? phone,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl,  Gender? gender,  DateTime? birthday,  double rating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'username_updated_at')  DateTime? usernameUpdatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.fullname,_that.email,_that.phone,_that.bio,_that.avatarUrl,_that.gender,_that.birthday,_that.rating,_that.totalReviews,_that.updatedAt,_that.createdAt,_that.usernameUpdatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? username,  String? fullname,  String? email,  String? phone,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl,  Gender? gender,  DateTime? birthday,  double rating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'username_updated_at')  DateTime? usernameUpdatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.username,_that.fullname,_that.email,_that.phone,_that.bio,_that.avatarUrl,_that.gender,_that.birthday,_that.rating,_that.totalReviews,_that.updatedAt,_that.createdAt,_that.usernameUpdatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? username,  String? fullname,  String? email,  String? phone,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl,  Gender? gender,  DateTime? birthday,  double rating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'username_updated_at')  DateTime? usernameUpdatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.fullname,_that.email,_that.phone,_that.bio,_that.avatarUrl,_that.gender,_that.birthday,_that.rating,_that.totalReviews,_that.updatedAt,_that.createdAt,_that.usernameUpdatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({required this.id, this.username, this.fullname, this.email, this.phone, this.bio, @JsonKey(name: 'avatar_url') this.avatarUrl, this.gender, this.birthday, this.rating = 0.0, @JsonKey(name: 'total_reviews') this.totalReviews = 0, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'username_updated_at') this.usernameUpdatedAt}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

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
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'username_updated_at') final  DateTime? usernameUpdatedAt;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.usernameUpdatedAt, usernameUpdatedAt) || other.usernameUpdatedAt == usernameUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,username,fullname,email,phone,bio,avatarUrl,gender,birthday,rating,totalReviews,updatedAt,createdAt,usernameUpdatedAt);
}

@override
String toString() {
    return 'UserModel(id: $id, username: $username, fullname: $fullname, email: $email, phone: $phone, bio: $bio, avatarUrl: $avatarUrl, gender: $gender, birthday: $birthday, rating: $rating, totalReviews: $totalReviews, updatedAt: $updatedAt, createdAt: $createdAt, usernameUpdatedAt: $usernameUpdatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? username, String? fullname, String? email, String? phone, String? bio,@JsonKey(name: 'avatar_url') String? avatarUrl, Gender? gender, DateTime? birthday, double rating,@JsonKey(name: 'total_reviews') int totalReviews,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'username_updated_at') DateTime? usernameUpdatedAt
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = freezed,Object? fullname = freezed,Object? email = freezed,Object? phone = freezed,Object? bio = freezed,Object? avatarUrl = freezed,Object? gender = freezed,Object? birthday = freezed,Object? rating = null,Object? totalReviews = null,Object? updatedAt = freezed,Object? createdAt = freezed,Object? usernameUpdatedAt = freezed,}) {
  return _then(_UserModel(
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
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,usernameUpdatedAt: freezed == usernameUpdatedAt ? _self.usernameUpdatedAt : usernameUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
