import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/session/repositories/session_repository.dart';
import '../../../../error/app_exception.dart';
import '../../../../error/mapper/app_exception_mapper.dart';
import '../../../../utils/safe_call.dart';
import '../remotes/session_remote.dart';

class SessionRepositoryImpl with SafeCall implements SessionRepository {
  final SessionRemote _remote;
  final AppExceptionMapper _exceptionMapper;

  const new({required this._remote, required this._exceptionMapper});

  @override
  Stream<Session?> authChange() {
    return _remote.authChange;
  }

  @override
  Future<Either<AppException, Unit>> signOut() {
    return call(
      doAction: () => _remote.signOut(),
      customErrorHandler: _exceptionMapper.map,
    );
  }
}
