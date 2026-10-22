import '../app_exception.dart';

abstract class AppExceptionMapper {
  AppException? map(Object e);
}

class CompositeExceptionMapper implements AppExceptionMapper {
  final List<AppExceptionMapper> _mappers;

  const new({required this._mappers});

  @override
  AppException? map(Object e) {
    for (final mapper in _mappers) {
      final exception = mapper.map(e);
      if (exception != null) return exception;
    }
    return null;
  }
}
