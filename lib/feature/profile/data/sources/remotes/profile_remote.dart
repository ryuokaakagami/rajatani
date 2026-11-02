import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../models/profile_update.dart';

abstract class ProfileRemote {
  Future<Unit> update({required String userId, required ProfileUpdate data});

  Future<Unit> requestContactUpdate({String? email, String? phone});

  Future<bool> verifyContactUpdate({
    String? email,
    String? phone,
    required String otp,
  });

  Future<Unit> resendRequestContactUpdate({String? email, String? phone});

  Future<Unit> checkUsernameAvailable({
    required String username,
    required String userId,
  });

  Future<Unit> setAvatar({
    required String userId,
    required String? url,
    required String? path,
  });

  Future<Unit> uploadAvatar({required String path, required File file});

  Future<Unit> removeAvatar({required String path});

  String avatarPublicUrl({required String path});
}
