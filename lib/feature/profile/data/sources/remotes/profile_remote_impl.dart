import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/client/client.dart';
import '../../models/profile_update.dart';
import 'profile_remote.dart';

class ProfileRemoteImpl implements ProfileRemote {
  final DatabaseClient _databaseClient;
  final StorageClient _storageClient;
  final AuthClient _authClient;

  static const _timeout = Duration(seconds: 30);

  const new({
    required this._databaseClient,
    required this._storageClient,
    required this._authClient,
  });

  @override
  Future<Unit> update({
    required String userId,
    required ProfileUpdate data,
  }) async {
    await _databaseClient.update(
      'profiles',
      data: data.toJson(),
      column: 'id',
      value: userId,
    );

    return unit;
  }

  @override
  Future<Unit> requestContactUpdate({String? email, String? phone}) async {
    assert(
      (email == null) != (phone == null),
      'Provide either email or phone.',
    );
    await _authClient.updateUser(
      attributes: UserAttributes(email: email, phone: phone),
    );
    return unit;
  }

  @override
  Future<bool> verifyContactUpdate({
    String? email,
    String? phone,
    required String otp,
  }) async {
    final hasEmail = email != null;

    final type = hasEmail ? OtpType.emailChange : OtpType.phoneChange;
    final res = await _authClient.verify(
      type: type,
      otp: otp,
      email: email,
      phone: phone,
    );

    final user = res.user;
    // Email: complete only when no pending new email remains (secure change
    // needs both codes). Phone: single code, so success means complete.
    return hasEmail ? user != null && user.newEmail == null : true;
  }

  @override
  Future<Unit> resendRequestContactUpdate({
    String? email,
    String? phone,
  }) async {
    final hasEmail = email != null;
    final type = hasEmail ? OtpType.emailChange : OtpType.phoneChange;
    await _authClient.resend(type: type, email: email, phone: phone);
    return unit;
  }

  @override
  Future<Unit> checkUsernameAvailable({
    required String username,
    required String userId,
  }) async {
    await _databaseClient.rpc(
      'check_username_available',
      params: {'p_username': username, 'p_user_id': userId},
    );
    return unit;
  }

  @override
  Future<Unit> setAvatar({
    required String userId,
    required String? url,
    required String? path,
  }) async {
    await _databaseClient.update(
      'profiles',
      data: {'avatar_url': url, 'avatar_path': path},
      column: 'id',
      value: userId,
    );
    return unit;
  }

  @override
  Future<Unit> uploadAvatar({required String path, required File file}) async {
    await _storageClient
        .upload(.avatars, path: path, file: file, contentType: 'image/webp')
        .timeout(_timeout);
    return unit;
  }

  @override
  String avatarPublicUrl({required String path}) =>
      _storageClient.publicUrl(.avatars, path: path);

  @override
  Future<Unit> removeAvatar({required String path}) async {
    await _storageClient.remove(.avatars, paths: [path]).timeout(_timeout);
    return unit;
  }
}
