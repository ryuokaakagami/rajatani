import 'package:dartz/dartz.dart';

import '../../../../../core/client/database/database_client.dart';
import '../../models/profile_update.dart';
import 'profile_remote.dart';

class ProfileRemoteImpl implements ProfileRemote {
  final DatabaseClient _client;

  const new({required this._client});

  @override
  Future<Unit> update({
    required String userId,
    required ProfileUpdate data,
  }) async {
    await _client.update(
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
    await _client.rpc(
      'check_username_available',
      params: {'p_username': username, 'p_user_id': userId},
    );
    return unit;
  }
}
