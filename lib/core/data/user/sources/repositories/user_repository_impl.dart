import 'package:dartz/dartz.dart';

import '../../../../domain/user/enitties/user_entity.dart';
import '../../../../domain/user/repositories/user_repository.dart';
import '../../../../error/app_exception.dart';
import '../../../../error/mapper/app_exception_mapper.dart';
import '../../../../utils/safe_call.dart';
import '../remotes/user_remote.dart';

class UserRepositoryImpl with SafeCall implements UserRepository {
  final UserRemote _remote;
  final AppExceptionMapper _exceptionMapper;

  const new({required this._remote, required this._exceptionMapper});

  @override
  Future<Either<AppException, UserEntity?>> fetch(String userId) {
    return call(
      doAction: () => _remote.fetch(userId),
      customErrorHandler: _exceptionMapper.map,
    );
  }
}
