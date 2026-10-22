import '../../../../domain/user/enitties/user_entity.dart';

abstract class UserRemote {
  Future<UserEntity?> fetch(String userId);
}
