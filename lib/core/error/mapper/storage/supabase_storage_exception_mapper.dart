import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app_exception.dart';
import '../app_exception_mapper.dart';

class SupabaseStorageExceptionMapper implements AppExceptionMapper {
  const new();

  @override
  AppException? map(Object e) {
    if (e is! StorageException) return null;

    return switch (int.tryParse(e.statusCode ?? '')) {
      403 => const StorageForbiddenException(),
      413 => const FileTooLargeException(),
      404 => const FileNotFoundStorageException(),
      409 => const FileAlreadyExistsStorageException(),
      int s when s >= 500 && s < 600 => const StorageServerException(),
      _ => _fromMessage(e),
    };
  }

  AppException? _fromMessage(StorageException e) {
    final text = '${e.message} ${e.error}'.toLowerCase();
    if (text.contains('row-level security')) {
      return const StorageForbiddenException();
    }
    return null;
  }
}
