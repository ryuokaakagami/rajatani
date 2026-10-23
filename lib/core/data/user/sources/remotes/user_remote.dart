import '../../models/user_model.dart';

abstract class UserRemote {
  Future<UserModel?> fetch(String userId);
}
