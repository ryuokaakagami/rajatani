part of 'auth_string.dart';

class _VerificationString {
  const new();

  final title = 'Verification';
  String subtitle(String contact) =>
      'Please enter the 6-digit code we just sent to '
      '$contact to verify your account.';

  final buttonVerifyLabel = 'Verify';
}
