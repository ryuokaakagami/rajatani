import 'package:dartz/dartz.dart';

import '../../models/profile_update.dart';

abstract class ProfileRemote {
  Future<Unit> update({required String userId, required ProfileUpdate data});
  Future<Unit> checkUsernameAvailable({
    required String username,
    required String userId,
  });
}
