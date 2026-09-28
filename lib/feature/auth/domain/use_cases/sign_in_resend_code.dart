import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../repositories/auth_repository.dart';

class SignInResendCode {
  final AuthRepository _repository;

  const new({required this._repository});

  Future<Either<AppException, Unit>> call({String? email, String? phone}) =>
      _repository.resend(email: email, phone: phone);
}
