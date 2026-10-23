import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/models/profile_update.dart';

abstract class ProfileRepository {
  Future<Either<AppException, Unit>> update({
    required String userId,
    required ProfileUpdate data,
  });

  Future<Either<AppException, Unit>> checkUsernameAvailable({
    required String username,
    required String userId,
  });
}
