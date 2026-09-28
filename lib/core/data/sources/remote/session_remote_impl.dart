import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../client/auth/auth_client.dart';
import '../../../client/auth/social_auth_client.dart';
import 'session_remote.dart';

class SessionRemoteImpl implements SessionRemote {
  final AuthClient _authClient;
  final SocialAuthClient _socialAuthClient;

  const new({required this._authClient, required this._socialAuthClient});

  @override
  Stream<Session?> get authChange {
    return _authClient.authChange.map((state) => state.session);
  }

  @override
  Future<Unit> signOut() async {
    await _authClient.signOut();
    await _socialAuthClient.signOut();
    return unit;
  }
}
