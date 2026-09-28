import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';

abstract class AuthRepository {
  Future<Either<AppException, Unit>> signInWithOtp({
    String? email,
    String? phone,
  });
  Future<Either<AppException, Unit>> signInWithGoogle();
  Future<Either<AppException, Unit>> verify({
    String? email,
    String? phone,
    required String otp,
  });
  Future<Either<AppException, Unit>> resend({String? email, String? phone});
}
