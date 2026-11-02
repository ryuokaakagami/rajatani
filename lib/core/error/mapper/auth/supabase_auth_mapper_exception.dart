import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app_exception.dart';
import '../app_exception_mapper.dart';

class SupabaseAuthMapperException implements AppExceptionMapper {
  const new();

  @override
  AppException? map(Object e) {
    if (e is! AuthException) return null;

    return switch (e.code) {
      'over_request_rate_limit' ||
      'over_email_send_rate_limit' ||
      'over_sms_send_rate_limit' => const AuthRateLimitException(),
      'email_address_invalid' => const AuthInvalidEmailException(),
      'phone_provider_disabled' ||
      'sms_send_failed' => const AuthSmsFailedException(),
      'user_banned' => const AuthUserBannedException(),
      'invalid_credentials' => const AuthInvalidCredentialsException(),
      'otp_expired' => const AuthOtpExpiredException(),
      'otp_disabled' => const AuthOtpDisabledException(),
      'email_exists' => const AuthEmailAlreadyUsedException(),
      'phone_exists' => const AuthPhoneAlreadyUsedException(),
      'validation_failed' => const AuthInvalidContactException(),
      'reauthentication_needed' || 'reauthentication_not_valid' =>
        const AuthReauthenticationRequiredException(),
      'session_not_found' ||
      'session_expired' => const AuthSessionExpiredAppException(),

      _ => null,
    };
  }
}
