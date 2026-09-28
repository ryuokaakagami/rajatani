import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../error/app_exception.dart';
import '../../data/models/google_token.dart';
import 'social_auth_client.dart';

class GoogleClient implements SocialAuthClient {
  final GoogleSignIn _google;

  const new({required this._google});

  @override
  Future<GoogleToken> fetchToken() async {
    final scopes = ['email', 'profile'];

    GoogleSignInAccount? account = await _google
        .attemptLightweightAuthentication();

    account ??= await _google.authenticate();

    final authorization =
        await account.authorizationClient.authorizationForScopes(scopes) ??
        await account.authorizationClient.authorizeScopes(scopes);

    final idToken = account.authentication.idToken;

    throwIf(idToken == null, UnknownException());

    return GoogleToken(
      idToken: idToken!,
      accessToken: authorization.accessToken,
    );
  }

  @override
  Future<void> signOut() async {
    await _google.signOut();
    await _google.disconnect();
  }
}
