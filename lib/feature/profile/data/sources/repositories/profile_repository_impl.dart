import 'package:dartz/dartz.dart';

import '../../../../../core/error/app_exception.dart';
import '../../../../../core/error/mapper/app_exception_mapper.dart';
import '../../../../../core/utils/safe_call.dart';
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
  }) {
    return call(
      doAction: () => _remote.update(userId: userId, data: data),
      customErrorHandler: _exceptionMapper.map,
    );
  }

  @override
  Future<Either<AppException, Unit>> checkUsernameAvailable({
    required String username,
    required String userId,
  }) {
    return call(
      doAction: () =>
          _remote.checkUsernameAvailable(username: username, userId: userId),
      customErrorHandler: _exceptionMapper.map,
    );
  }
}
