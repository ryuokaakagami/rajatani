import '../../../../client/database/database_client.dart';
import '../../models/user_model.dart';
import 'user_remote.dart';

class UserRemoteImpl implements UserRemote {
  final DatabaseClient _client;

  const new({required this._client});

  @override
  Future<UserModel?> fetch(String userId) async {
    final json = await _client.read('profiles', column: 'id', value: userId);
    if (json == null) return null;
    return UserModel.fromJson(json);
  }
}
