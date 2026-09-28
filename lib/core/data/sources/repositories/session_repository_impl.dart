import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/repositories/session_repository.dart';
import '../../../error/app_exception.dart';
import '../../../error/handler/auth_exception_handler.dart';
import '../../../utils/safe_call.dart';
import '../remote/session_remote.dart';

class SessionRepositoryImpl with SafeCall implements SessionRepository {
  final SessionRemote _remote;
  final AuthExceptionHandler _exceptionHandler;

  const new({required this._remote, required this._exceptionHandler});

  @override
  Stream<Session?> authChange() {
    return _remote.authChange;
  }

  @override
  Future<Either<AppException, Unit>> signOut() {
    return call(
      doAction: () => _remote.signOut(),
      customErrorHandler: _exceptionHandler.map,
    );
  }
}
