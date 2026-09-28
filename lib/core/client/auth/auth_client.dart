import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthClient {
  Stream<AuthState> get authChange;
  Future<void> signInWithOtp({String? email, String? phone});
  Future<void> signInWithGoogle({required String idToken, String? accessToken});
  Future<void> verify({required OtpType type, String? email, String? phone, required String otp});
  Future<void> resend({required OtpType type, String? email, String? phone});
  Future<void> signOut();
}
