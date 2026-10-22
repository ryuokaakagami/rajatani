import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../error/app_exception.dart';

abstract class SessionRepository {
  Stream<Session?> authChange();
  Future<Either<AppException, Unit>> signOut();
}
