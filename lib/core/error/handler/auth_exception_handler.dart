import '../app_exception.dart';
import '../mapper/auth/auth_exception_mapper.dart';

class AuthExceptionHandler {
  final List<AuthExceptionMapper> _mappers;

  const new({required this._mappers});

  AppException? map(Object e) {
    for (final mapper in _mappers) {
      final exception = mapper.map(e);
      if (exception != null) return exception;
    }
    return null;
  }
}
