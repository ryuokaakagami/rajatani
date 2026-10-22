import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories/session_repository.dart';

class ObserveSession {
  final SessionRepository _repository;

  const new({required this._repository});

  Stream<Session?> call() => _repository.authChange();
}
