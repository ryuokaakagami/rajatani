// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_mode_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
SignInModeState _$SignInModeStateFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'email':
          return _Email.fromJson(
            json
          );
                case 'phone':
          return _Phone.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'SignInModeState',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$SignInModeState {



  /// Serializes this SignInModeState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInModeState);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInModeState()';
}


}

/// @nodoc
class $SignInModeStateCopyWith<$Res>  {
$SignInModeStateCopyWith(SignInModeState _, $Res Function(SignInModeState) __);
}


/// Adds pattern-matching-related methods to [SignInModeState].
extension SignInModeStatePatterns on SignInModeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Email value)?  email,TResult Function( _Phone value)?  phone,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Email() when email != null:
return email(_that);case _Phone() when phone != null:
return phone(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Email value)  email,required TResult Function( _Phone value)  phone,}){
final _that = this;
switch (_that) {
case _Email():
return email(_that);case _Phone():
return phone(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Email value)?  email,TResult? Function( _Phone value)?  phone,}){
final _that = this;
switch (_that) {
case _Email() when email != null:
return email(_that);case _Phone() when phone != null:
return phone(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  email,TResult Function()?  phone,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Email() when email != null:
return email();case _Phone() when phone != null:
return phone();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  email,required TResult Function()  phone,}) {final _that = this;
switch (_that) {
case _Email():
return email();case _Phone():
return phone();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  email,TResult? Function()?  phone,}) {final _that = this;
switch (_that) {
case _Email() when email != null:
return email();case _Phone() when phone != null:
return phone();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Email extends SignInModeState {
  const _Email({ String? $type}): $type = $type ?? 'email',super._();
  factory _Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$EmailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Email);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInModeState.email()';
}


}




/// @nodoc
@JsonSerializable()

class _Phone extends SignInModeState {
  const _Phone({ String? $type}): $type = $type ?? 'phone',super._();
  factory _Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$PhoneToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Phone);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignInModeState.phone()';
}


}




// dart format on
