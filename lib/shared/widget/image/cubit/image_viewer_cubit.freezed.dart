// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_viewer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageViewerState {

 double get dragOffsetY; bool get isDragging; bool get isZoomed; bool get isDismissed;
/// Create a copy of ImageViewerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageViewerStateCopyWith<ImageViewerState> get copyWith => _$ImageViewerStateCopyWithImpl<ImageViewerState>(this as ImageViewerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImageViewerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageViewerState&&(identical(other.dragOffsetY, _this.dragOffsetY) || other.dragOffsetY == _this.dragOffsetY)&&(identical(other.isDragging, _this.isDragging) || other.isDragging == _this.isDragging)&&(identical(other.isZoomed, _this.isZoomed) || other.isZoomed == _this.isZoomed)&&(identical(other.isDismissed, _this.isDismissed) || other.isDismissed == _this.isDismissed));
}


@override
int get hashCode {
  final _this = this as ImageViewerState;
  return Object.hash(runtimeType,_this.dragOffsetY,_this.isDragging,_this.isZoomed,_this.isDismissed);
}

@override
String toString() {
  final _this = this as ImageViewerState;
  return 'ImageViewerState(dragOffsetY: ${_this.dragOffsetY}, isDragging: ${_this.isDragging}, isZoomed: ${_this.isZoomed}, isDismissed: ${_this.isDismissed})';
}


}

/// @nodoc
abstract mixin class $ImageViewerStateCopyWith<$Res>  {
  factory $ImageViewerStateCopyWith(ImageViewerState value, $Res Function(ImageViewerState) _then) = _$ImageViewerStateCopyWithImpl;
@useResult
$Res call({
 double dragOffsetY, bool isDragging, bool isZoomed, bool isDismissed
});




}
/// @nodoc
class _$ImageViewerStateCopyWithImpl<$Res>
    implements $ImageViewerStateCopyWith<$Res> {
  _$ImageViewerStateCopyWithImpl(this._self, this._then);

  final ImageViewerState _self;
  final $Res Function(ImageViewerState) _then;

/// Create a copy of ImageViewerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dragOffsetY = null,Object? isDragging = null,Object? isZoomed = null,Object? isDismissed = null,}) {
  return _then(ImageViewerState(
dragOffsetY: null == dragOffsetY ? _self.dragOffsetY : dragOffsetY // ignore: cast_nullable_to_non_nullable
as double,isDragging: null == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as bool,isZoomed: null == isZoomed ? _self.isZoomed : isZoomed // ignore: cast_nullable_to_non_nullable
as bool,isDismissed: null == isDismissed ? _self.isDismissed : isDismissed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageViewerState].
extension ImageViewerStatePatterns on ImageViewerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageViewerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageViewerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageViewerState value)  $default,){
final _that = this;
switch (_that) {
case _ImageViewerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageViewerState value)?  $default,){
final _that = this;
switch (_that) {
case _ImageViewerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double dragOffsetY,  bool isDragging,  bool isZoomed,  bool isDismissed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageViewerState() when $default != null:
return $default(_that.dragOffsetY,_that.isDragging,_that.isZoomed,_that.isDismissed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double dragOffsetY,  bool isDragging,  bool isZoomed,  bool isDismissed)  $default,) {final _that = this;
switch (_that) {
case _ImageViewerState():
return $default(_that.dragOffsetY,_that.isDragging,_that.isZoomed,_that.isDismissed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double dragOffsetY,  bool isDragging,  bool isZoomed,  bool isDismissed)?  $default,) {final _that = this;
switch (_that) {
case _ImageViewerState() when $default != null:
return $default(_that.dragOffsetY,_that.isDragging,_that.isZoomed,_that.isDismissed);case _:
  return null;

}
}

}

/// @nodoc


class _ImageViewerState implements ImageViewerState {
  const _ImageViewerState({this.dragOffsetY = .0, this.isDragging = false, this.isZoomed = false, this.isDismissed = false});
  

@override@JsonKey() final  double dragOffsetY;
@override@JsonKey() final  bool isDragging;
@override@JsonKey() final  bool isZoomed;
@override@JsonKey() final  bool isDismissed;

/// Create a copy of ImageViewerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageViewerStateCopyWith<_ImageViewerState> get copyWith => __$ImageViewerStateCopyWithImpl<_ImageViewerState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageViewerState&&(identical(other.dragOffsetY, dragOffsetY) || other.dragOffsetY == dragOffsetY)&&(identical(other.isDragging, isDragging) || other.isDragging == isDragging)&&(identical(other.isZoomed, isZoomed) || other.isZoomed == isZoomed)&&(identical(other.isDismissed, isDismissed) || other.isDismissed == isDismissed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dragOffsetY,isDragging,isZoomed,isDismissed);
}

@override
String toString() {
    return 'ImageViewerState(dragOffsetY: $dragOffsetY, isDragging: $isDragging, isZoomed: $isZoomed, isDismissed: $isDismissed)';
}


}

/// @nodoc
abstract mixin class _$ImageViewerStateCopyWith<$Res> implements $ImageViewerStateCopyWith<$Res> {
  factory _$ImageViewerStateCopyWith(_ImageViewerState value, $Res Function(_ImageViewerState) _then) = __$ImageViewerStateCopyWithImpl;
@override @useResult
$Res call({
 double dragOffsetY, bool isDragging, bool isZoomed, bool isDismissed
});




}
/// @nodoc
class __$ImageViewerStateCopyWithImpl<$Res>
    implements _$ImageViewerStateCopyWith<$Res> {
  __$ImageViewerStateCopyWithImpl(this._self, this._then);

  final _ImageViewerState _self;
  final $Res Function(_ImageViewerState) _then;

/// Create a copy of ImageViewerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dragOffsetY = null,Object? isDragging = null,Object? isZoomed = null,Object? isDismissed = null,}) {
  return _then(_ImageViewerState(
dragOffsetY: null == dragOffsetY ? _self.dragOffsetY : dragOffsetY // ignore: cast_nullable_to_non_nullable
as double,isDragging: null == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as bool,isZoomed: null == isZoomed ? _self.isZoomed : isZoomed // ignore: cast_nullable_to_non_nullable
as bool,isDismissed: null == isDismissed ? _self.isDismissed : isDismissed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
