import 'package:dartz/dartz.dart';

import '../../../error/app_exception.dart';
import '../repositories/session_repository.dart';

class SignOut {
  final SessionRepository _repository;

  const new({required this._repository});

  Future<Either<AppException, Unit>> call() => _repository.signOut();
}
