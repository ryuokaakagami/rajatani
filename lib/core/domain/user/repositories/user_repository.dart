import 'package:dartz/dartz.dart';

import '../../../error/error.dart';
import '../enitties/user_entity.dart';

abstract class UserRepository {
  Future<Either<AppException, UserEntity?>> fetch(String userId);
}
