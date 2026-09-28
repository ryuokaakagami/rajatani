import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository _repository;

  const new({required this._repository});

  Future<Either<AppException, Unit>> call() => _repository.signInWithGoogle();
}
