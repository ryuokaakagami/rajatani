import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app_exception.dart';
import '../app_exception_mapper.dart';

class SupabaseDatabaseExceptionMapper implements AppExceptionMapper {
  const new();

  @override
  AppException? map(Object e) {
    if (e is! PostgrestException) return null;

    return switch (e.code) {
      '23505' => const DatabaseDuplicateException(),
      '23503' => const DatabaseReferenceException(),
      '23502' || '23514' || '22P02' => const DatabaseInvalidDataException(),
      '42501' => const DatabasePermissionDeniedException(),
      'PGRST301' || 'PGRST303' => const DatabaseSessionExpiredException(),
      _ => null,
    };
  }
}
