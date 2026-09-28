part of '../app_exception.dart';

// --- General Auth Exceptions ---
class AuthRateLimitException extends AppException {
  const new()
    : super(
        message:
            'Terlalu banyak percobaan. Silakan coba lagi dalam beberapa menit.',
      );
}

class AuthUserBannedException extends AppException {
  const new()
    : super(
        message:
            'Akun ini telah ditangguhkan. Silakan hubungi layanan pelanggan.',
      );
}

class AuthInvalidCredentialsException extends AppException {
  const new()
    : super(
        message:
            'Kredensial tidak valid. Silakan periksa data Anda dan coba lagi.',
      );
}

class AuthOtpExpiredException extends AppException {
  const new()
    : super(message: 'Kode OTP telah kedaluwarsa. Silakan minta kode baru.');
}

class AuthOtpDisabledException extends AppException {
  const new() : super(message: 'Verifikasi OTP saat ini tidak tersedia.');
}

class AuthSmsFailedException extends AppException {
  const new()
    : super(
        message: 'Gagal mengirim SMS OTP. Pastikan nomor telepon Anda valid dan aktif.',
      );
}

class AuthInvalidEmailException extends AppException {
  const new() : super(message: 'Alamat email tidak valid atau tidak didukung.');
}

// --- Google Sign-In Exceptions ---
class AuthGoogleInterruptedException extends AppException {
  const new()
    : super(message: 'Proses login Google terputus. Silakan coba lagi.');
}

class AuthGoogleUnavailableException extends AppException {
  const new()
    : super(
        message:
            'Login Google saat ini tidak tersedia. Silakan coba lagi nanti.',
      );
}

class AuthGoogleUserMismatchException extends AppException {
  const new()
    : super(
        message: 'Ada masalah pada akun Anda. Silakan keluar dan coba lagi.',
      );
}
