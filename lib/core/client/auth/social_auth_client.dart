import '../../data/models/google_token.dart';

abstract class SocialAuthClient {
  Future<GoogleToken> fetchToken();
  Future<void> signOut();
}
