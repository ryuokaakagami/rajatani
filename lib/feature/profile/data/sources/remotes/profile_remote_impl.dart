import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/client/client.dart';
import '../../models/profile_update.dart';
import 'profile_remote.dart';

class ProfileRemoteImpl implements ProfileRemote {
  final DatabaseClient _databaseClient;
  final StorageClient _storageClient;

  static const _timeout = Duration(seconds: 30);

  const new({required this._databaseClient, required this._storageClient});

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
