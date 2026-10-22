import 'package:dartz/dartz.dart';

import '../../../error/error.dart';
import '../enitties/user_entity.dart';
import '../repositories/user_repository.dart';

class FetchDataUser {
  final UserRepository _repository;

  const new({required this._repository});

  Future<Either<AppException, UserEntity?>> call(String userId) async {
    return await _repository.fetch(userId);
  }
}
