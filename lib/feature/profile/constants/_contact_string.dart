part of 'profile_string.dart';

class _ContactString {
  const new();

  // Verification sheet subtitle
  String subtitleAdd(String newEmail) =>
      'We sent a code to ${newEmail.toMaskEmail}. Enter it to add this email.';

  String subtitleChangeOld(String oldEmail) =>
      'We sent codes to both emails. Enter the one sent to ${oldEmail.toMaskEmail} first.';

  String subtitleChangeNew(String newEmail) =>
      'Now enter the code we sent to ${newEmail.toMaskEmail} to finish updating.';

  // Verification sheet subtitle (phone)
  String subtitlePhone(String newPhone) =>
      'We sent a code to ${newPhone.normalizePhone.toMaskPhone}. Enter it to verify this number.';

  // Restart dialog
  final String titleRestartVerification = 'Restart verification?';

  final String messageRestartVerification =
      'We will send new codes to both emails and start over from step 1.';

  final String restart = 'Restart';
}
