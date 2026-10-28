import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/core.dart';
import 'auth_remote.dart';

class AuthRemoteImpl implements AuthRemote {
  final AuthClient _authClient;
  final SocialAuthClient _socialAuthClient;

  new({required this._authClient, required this._socialAuthClient});

  @override
  Future<Unit> signInWithOtp({String? email, String? phone}) async {
    await _authClient.signInWithOtp(email: email, phone: phone);
    return unit;
  }

  @override
  Future<Unit> signInWithGoogle() async {
    final token = await _socialAuthClient.fetchToken();
    await _authClient.signInWithGoogle(
      idToken: token.idToken,
      accessToken: token.accessToken,
    );
    return unit;
  }

  @override
  Future<Unit> verify({
    String? email,
    String? phone,
    required String otp,
  }) async {
    final type = email != null ? OtpType.email : OtpType.sms;
    await _authClient.verify(type: type, email: email, phone: phone, otp: otp);
    return unit;
  }

  @override
  Future<Unit> resend({String? email, String? phone}) async {
    if (email != null) {
      await _authClient.signInWithOtp(email: email);
      return unit;
    }
    await _authClient.resend(type: .sms, phone: phone);
    return unit;
  }
}
