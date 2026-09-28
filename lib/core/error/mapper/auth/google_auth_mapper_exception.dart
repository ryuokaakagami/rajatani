import 'package:google_sign_in/google_sign_in.dart';

import '../../app_exception.dart';
import 'auth_exception_mapper.dart';

class GoogleAuthMapperException implements AuthExceptionMapper {
  const new();

  @override
  AppException? map(Object e) {
    if (e is! GoogleSignInException) return null;

    return switch (e.code) {
      .canceled || .interrupted => AuthGoogleInterruptedException(),
      .uiUnavailable => AuthGoogleUnavailableException(),
      .userMismatch => AuthGoogleUserMismatchException(),

      _ => null,
    };
  }
}
