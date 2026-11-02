import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/app_exception.dart';
import '../../../../../core/error/mapper/app_exception_mapper.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../models/profile_update.dart';
import '../remotes/profile_remote.dart';

class ProfileRepositoryImpl with SafeCall implements ProfileRepository {
  final ProfileRemote _remote;
  final AppExceptionMapper _exceptionMapper;

  const new({required this._remote, required this._exceptionMapper});

  @override
  Future<Either<AppException, Unit>> update({
    required String userId,
    required ProfileUpdate data,
  }) => call(
    doAction: () => _remote.update(userId: userId, data: data),
    customErrorHandler: _exceptionMapper.map,
  );

  @override
  Future<Either<AppException, Unit>> requestContactUpdate({
    String? email,
    String? phone,
  }) => call(
    doAction: () => _remote.requestContactUpdate(email: email, phone: phone),
    customErrorHandler: _exceptionMapper.map,
  );

  @override
  Future<Either<AppException, bool>> verifyContactUpdate({
    String? email,
    String? phone,
    required String otp,
  }) => call(
    doAction: () =>
        _remote.verifyContactUpdate(otp: otp, email: email, phone: phone),
    customErrorHandler: _exceptionMapper.map,
  );

  @override
  Future<Either<AppException, Unit>> resendRequestContactUpdate({
    String? email,
    String? phone,
  }) => call(
    doAction: () =>
        _remote.resendRequestContactUpdate(email: email, phone: phone),
    customErrorHandler: _exceptionMapper.map,
  );

  @override
  Future<Either<AppException, Unit>> checkUsernameAvailable({
    required String username,
    required String userId,
  }) => call(
    doAction: () =>
        _remote.checkUsernameAvailable(username: username, userId: userId),
    customErrorHandler: _exceptionMapper.map,
  );

  @override
  Future<Either<AppException, Unit>> uploadAvatar({
    required String path,
    required File file,
  }) => call(
    doAction: () => _remote.uploadAvatar(path: path, file: file),
    customErrorHandler: _exceptionMapper.map,
  );

  @override
  Future<Either<AppException, Unit>> setAvatar({
    required String userId,
    required String? url,
    required String? path,
  }) => call(
    doAction: () => _remote.setAvatar(userId: userId, url: url, path: path),
    customErrorHandler: _exceptionMapper.map,
  );

  @override
  Future<Either<AppException, Unit>> removeAvatar({required String path}) =>
      call(
        doAction: () => _remote.removeAvatar(path: path),
        customErrorHandler: _exceptionMapper.map,
      );

  @override
  String avatarPublicUrl({required String path}) =>
      _remote.avatarPublicUrl(path: path);
}
