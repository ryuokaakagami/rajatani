import '../../../../client/database/database_client.dart';
import '../../../../domain/user/enitties/user_entity.dart';
import 'user_remote.dart';

class UserRemoteImpl implements UserRemote {
  final DatabaseClient _client;

  const new({required this._client});

  @override
  Future<UserEntity?> fetch(String userId) async {
    final result = await _client.read('profiles', column: 'id', value: userId);
    if (result == null) return null;
    return UserEntity.fromJson(result);
  }
}
