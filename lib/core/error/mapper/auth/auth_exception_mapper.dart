import '../../app_exception.dart';

abstract class AuthExceptionMapper {
  AppException? map(Object e);
}
