part of '../app_exception.dart';

// --- General Auth Exceptions ---
class AuthRateLimitException extends AppException {
  const new()
    : super(message: 'Too many attempts. Please try again in a few minutes.');
}

class AuthUserBannedException extends AppException {
  const new()
    : super(
        message:
            'This account has been suspended. Please contact customer service.',
      );
}

class AuthInvalidCredentialsException extends AppException {
  const new()
    : super(
        message:
            'Invalid credentials. Please check your details and try again.',
      );
}

class AuthOtpExpiredException extends AppException {
  const new()
    : super(message: 'The OTP code has expired. Please request a new one.');
}

class AuthOtpDisabledException extends AppException {
  const new() : super(message: 'OTP verification is currently unavailable.');
}

class AuthSmsFailedException extends AppException {
  const new()
    : super(
        message: 'Failed to send SMS OTP. Please ensure your phone number is valid and active.',
      );
}

class AuthInvalidEmailException extends AppException {
  const new() : super(message: 'The email address is invalid or unsupported.');
}

// --- Contact Change Exceptions ---
class AuthEmailAlreadyUsedException extends AppException {
  const AuthEmailAlreadyUsedException()
    : super(message: 'This email address is already used by another account.');
}

class AuthPhoneAlreadyUsedException extends AppException {
  const AuthPhoneAlreadyUsedException()
    : super(message: 'This phone number is already used by another account.');
}

class AuthInvalidContactException extends AppException {
  const AuthInvalidContactException()
    : super(message: 'The email address or phone number is invalid.');
}

class AuthReauthenticationRequiredException extends AppException {
  const AuthReauthenticationRequiredException()
    : super(message: 'Please verify your identity again before changing this.');
}

class AuthSessionExpiredAppException extends AppException {
  const AuthSessionExpiredAppException()
    : super(message: 'Your session has ended. Please sign in again.');
}

// --- Google Sign-In Exceptions ---
class AuthGoogleInterruptedException extends AppException {
  const new()
    : super(message: 'Google sign-in was interrupted. Please try again.');
}

class AuthGoogleUnavailableException extends AppException {
  const new()
    : super(
        message:
            'Google sign-in is currently unavailable. Please try again later.',
      );
}

class AuthGoogleUserMismatchException extends AppException {
  const new()
    : super(
        message: 'There is an issue with your account. Please sign out and try again.',
      );
}
