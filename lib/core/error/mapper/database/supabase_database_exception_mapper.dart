import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app_exception.dart';
import '../app_exception_mapper.dart';

class SupabaseDatabaseExceptionMapper implements AppExceptionMapper {
  const new();

  @override
  AppException? map(Object e) {
    if (e is! PostgrestException) return null;

    return switch (e.code) {
      // --- Custom Username Exceptions ---
      'USN01' => const UsernameTooShortException(),
      'USN02' => const UsernameAlreadyExistsException(),
      'USN03' => const UsernameCooldownException(),
      'USN04' => const UsernameInvalidCharactersException(),

      // --- Standard Database Exceptions ---
      '23505' =>
        _isUsernameConflict(e)
            ? const UsernameAlreadyExistsException()
            : const DatabaseDuplicateException(),
      '23503' => const DatabaseReferenceException(),
      '23502' || '23514' || '22P02' => const DatabaseInvalidDataException(),
      '42501' => const DatabasePermissionDeniedException(),
      'PGRST301' || 'PGRST303' => const DatabaseSessionExpiredException(),
      _ => null,
    };
  }

  bool _isUsernameConflict(PostgrestException e) =>
      '${e.message} ${e.details}'.contains('username');
}
