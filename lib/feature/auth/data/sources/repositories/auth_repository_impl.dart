import 'package:dartz/dartz.dart';

import '../../../../../core/error/app_exception.dart';
import '../../../../../core/error/handler/auth_exception_handler.dart';
import '../../../../../core/utils/safe_call.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../remote/auth_remote.dart';

class AuthRepositoryImpl with SafeCall implements AuthRepository {
  final AuthRemote _remote;
  final AuthExceptionHandler _exceptionHandler;

  const new({required this._remote, required this._exceptionHandler});

  @override
  Future<Either<AppException, Unit>> signInWithOtp({
    String? email,
    String? phone,
  }) => call(
    doAction: () => _remote.signInWithOtp(email: email, phone: phone),
    customErrorHandler: _exceptionHandler.map,
  );

  @override
  Future<Either<AppException, Unit>> signInWithGoogle() => call(
    doAction: () => _remote.signInWithGoogle(),
    customErrorHandler: _exceptionHandler.map,
  );

  @override
  Future<Either<AppException, Unit>> verify({
    String? email,
    String? phone,
    required String otp,
  }) => call(
    doAction: () => _remote.verify(email: email, phone: phone, otp: otp),
    customErrorHandler: _exceptionHandler.map,
  );

  @override
  Future<Either<AppException, Unit>> resend({String? email, String? phone}) =>
      call(
        doAction: () => _remote.resend(email: email, phone: phone),
        customErrorHandler: _exceptionHandler.map,
      );
}
