import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../repositories/profile_repository.dart';

class CheckUsernameAvailable {
  final ProfileRepository _repository;

  new({required this._repository});

  Future<Either<AppException, Unit>> call({
    required String username,
    required String userId,
  }) => _repository.checkUsernameAvailable(username: username, userId: userId);
}
