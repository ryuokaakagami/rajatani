part of 'auth_string.dart';

class _VerifcationString {
  const new();

  final title = 'Verification';
  String subtitle(String contact) =>
      'Silakan masukkan 6 digit kode yang baru saja kami kirimkan ke '
      '$contact untuk memverifikasi akun Anda.';

  final buttonVerifyLabel = 'Verify';

  final didntReceive = 'Didn\'t receive the code?';
  final resendIn = 'Resend in';
  final resendNow = 'Resend now';
}
