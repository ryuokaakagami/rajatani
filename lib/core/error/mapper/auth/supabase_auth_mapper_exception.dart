import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app_exception.dart';
import 'auth_exception_mapper.dart';

class SupabaseAuthMapperException implements AuthExceptionMapper {
  const new();

  @override
  AppException? map(Object e) {
    if (e is! AuthException) return null;

    return switch (e.code) {
      'over_request_rate_limit' ||
      'over_email_send_rate_limit' ||
      'over_sms_send_rate_limit' => const AuthRateLimitException(),
      'email_address_invalid' => const AuthInvalidEmailException(),
      'user_banned' => const AuthUserBannedException(),
      'invalid_credentials' => const AuthInvalidCredentialsException(),
      'otp_expired' => const AuthOtpExpiredException(),
      'otp_disabled' => const AuthOtpDisabledException(),
      'sms_send_failed' => const AuthSmsFailedException(),

      _ => null,
    };
  }
}
