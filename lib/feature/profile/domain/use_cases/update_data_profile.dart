import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../../data/models/profile_update.dart';
import '../repositories/profile_repository.dart';

class UpdateDataProfile {
  final ProfileRepository _repository;

  const new({required this._repository});

  Future<Either<AppException, Unit>> call({
    required String userId,
    required ProfileUpdate data,
  }) => _repository.update(userId: userId, data: data);
}
