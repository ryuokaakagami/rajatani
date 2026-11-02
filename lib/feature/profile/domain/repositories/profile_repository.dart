import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/models/profile_update.dart';

abstract class ProfileRepository {
  Future<Either<AppException, Unit>> update({
    required String userId,
    required ProfileUpdate data,
  });

  Future<Either<AppException, Unit>> requestContactUpdate({
    String? email,
    String? phone,
  });

  Future<Either<AppException, bool>> verifyContactUpdate({
    String? email,
    String? phone,
    required String otp,
  });

  Future<Either<AppException, Unit>> resendRequestContactUpdate({
    String? email,
    String? phone,
  });

  Future<Either<AppException, Unit>> checkUsernameAvailable({
    required String username,
    required String userId,
  });

  Future<Either<AppException, Unit>> setAvatar({
    required String userId,
    required String? url,
    required String? path,
  });

  Future<Either<AppException, Unit>> uploadAvatar({
    required String path,
    required File file,
  });

  String avatarPublicUrl({required String path});

  Future<Either<AppException, Unit>> removeAvatar({required String path});
}
