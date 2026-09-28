import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SessionRemote {
  Stream<Session?> get authChange;
  Future<Unit> signOut();
}
