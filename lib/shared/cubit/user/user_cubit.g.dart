// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Initial _$InitialFromJson(Map<String, dynamic> json) => _Initial(
  data: json['data'] == null
      ? null
      : UserEntity.fromJson(json['data'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$InitialToJson(_Initial instance) => <String, dynamic>{
  'data': instance.data,
  'runtimeType': instance.$type,
};

_Loading _$LoadingFromJson(Map<String, dynamic> json) => _Loading(
  data: json['data'] == null
      ? null
      : UserEntity.fromJson(json['data'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoadingToJson(_Loading instance) => <String, dynamic>{
  'data': instance.data,
  'runtimeType': instance.$type,
};

_Loaded _$LoadedFromJson(Map<String, dynamic> json) => _Loaded(
  data: json['data'] == null
      ? null
      : UserEntity.fromJson(json['data'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoadedToJson(_Loaded instance) => <String, dynamic>{
  'data': instance.data,
  'runtimeType': instance.$type,
};

_Error _$ErrorFromJson(Map<String, dynamic> json) => _Error(
  data: json['data'] == null
      ? null
      : UserEntity.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'runtimeType': instance.$type,
};
