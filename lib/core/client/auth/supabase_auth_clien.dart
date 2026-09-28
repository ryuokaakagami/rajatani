import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_client.dart';

class SupabaseAuthClient implements AuthClient {
  final SupabaseClient _supabase;

  const new({required this._supabase});

  @override
  Stream<AuthState> get authChange => _supabase.auth.onAuthStateChange;

  @override
  Future<void> signInWithOtp({String? email, String? phone}) =>
      _supabase.auth.signInWithOtp(email: email, phone: phone);

  @override
  Future<void> signInWithGoogle({
    required String idToken,
    String? accessToken,
  }) => _supabase.auth.signInWithIdToken(
    provider: .google,
    idToken: idToken,
    accessToken: accessToken,
  );
  @override
  Future<void> verify({
    required OtpType type,
    String? email,
    String? phone,
    required String otp,
  }) => _supabase.auth.verifyOTP(
    type: type,
    email: email,
    phone: phone,
    token: otp,
  );

  @override
  Future<void> resend({required OtpType type, String? email, String? phone}) =>
      _supabase.auth.resend(type: type, email: email, phone: phone);

  @override
  Future<void> signOut() => _supabase.auth.signOut();
}
