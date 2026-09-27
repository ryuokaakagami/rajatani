// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_timer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResendTimerState {

 int get increment;
/// Create a copy of ResendTimerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendTimerStateCopyWith<ResendTimerState> get copyWith => _$ResendTimerStateCopyWithImpl<ResendTimerState>(this as ResendTimerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResendTimerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendTimerState&&(identical(other.increment, _this.increment) || other.increment == _this.increment));
}


@override
int get hashCode {
  final _this = this as ResendTimerState;
  return Object.hash(runtimeType,_this.increment);
}

@override
String toString() {
  final _this = this as ResendTimerState;
  return 'ResendTimerState(increment: ${_this.increment})';
}


}

/// @nodoc
abstract mixin class $ResendTimerStateCopyWith<$Res>  {
  factory $ResendTimerStateCopyWith(ResendTimerState value, $Res Function(ResendTimerState) _then) = _$ResendTimerStateCopyWithImpl;
@useResult
$Res call({
 int increment
});




}
/// @nodoc
class _$ResendTimerStateCopyWithImpl<$Res>
    implements $ResendTimerStateCopyWith<$Res> {
  _$ResendTimerStateCopyWithImpl(this._self, this._then);

  final ResendTimerState _self;
  final $Res Function(ResendTimerState) _then;

/// Create a copy of ResendTimerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? increment = null,}) {
  return _then(_self.copyWith(
increment: null == increment ? _self.increment : increment // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ResendTimerState].
extension ResendTimerStatePatterns on ResendTimerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Progress value)?  progress,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Progress() when progress != null:
return progress(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Progress value)  progress,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Progress():
return progress(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Progress value)?  progress,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Progress() when progress != null:
return progress(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int increment)?  initial,TResult Function( int remaining,  int increment)?  progress,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.increment);case _Progress() when progress != null:
return progress(_that.remaining,_that.increment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int increment)  initial,required TResult Function( int remaining,  int increment)  progress,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.increment);case _Progress():
return progress(_that.remaining,_that.increment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int increment)?  initial,TResult? Function( int remaining,  int increment)?  progress,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.increment);case _Progress() when progress != null:
return progress(_that.remaining,_that.increment);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends ResendTimerState {
  const _Initial(this.increment): super._();
  

@override final  int increment;

/// Create a copy of ResendTimerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.increment, increment) || other.increment == increment));
}


@override
int get hashCode {
    return Object.hash(runtimeType,increment);
}

@override
String toString() {
    return 'ResendTimerState.initial(increment: $increment)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ResendTimerStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 int increment
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ResendTimerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? increment = null,}) {
  return _then(_Initial(
null == increment ? _self.increment : increment // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Progress extends ResendTimerState {
  const _Progress({this.remaining = 0, required this.increment}): super._();
  

@JsonKey() final  int remaining;
@override final  int increment;

/// Create a copy of ResendTimerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressCopyWith<_Progress> get copyWith => __$ProgressCopyWithImpl<_Progress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Progress&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.increment, increment) || other.increment == increment));
}


@override
int get hashCode {
    return Object.hash(runtimeType,remaining,increment);
}

@override
String toString() {
    return 'ResendTimerState.progress(remaining: $remaining, increment: $increment)';
}


}

/// @nodoc
abstract mixin class _$ProgressCopyWith<$Res> implements $ResendTimerStateCopyWith<$Res> {
  factory _$ProgressCopyWith(_Progress value, $Res Function(_Progress) _then) = __$ProgressCopyWithImpl;
@override @useResult
$Res call({
 int remaining, int increment
});




}
/// @nodoc
class __$ProgressCopyWithImpl<$Res>
    implements _$ProgressCopyWith<$Res> {
  __$ProgressCopyWithImpl(this._self, this._then);

  final _Progress _self;
  final $Res Function(_Progress) _then;

/// Create a copy of ResendTimerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remaining = null,Object? increment = null,}) {
  return _then(_Progress(
remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,increment: null == increment ? _self.increment : increment // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
