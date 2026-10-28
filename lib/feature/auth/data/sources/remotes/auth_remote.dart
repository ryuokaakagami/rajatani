import 'package:dartz/dartz.dart';

abstract class AuthRemote {
  Future<Unit> signInWithOtp({String? email, String? phone});
  Future<Unit> signInWithGoogle();
  Future<Unit> verify({String? email, String? phone, required String otp});
  Future<Unit> resend({String? email, String? phone});
}
