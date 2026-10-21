part of 'profile_string.dart';

class _EditString {
  const new();

  final String nameHint = 'Enter your fullname';
  final String nameHelper =
      'Use your real name. It appears on your profile and order details.';

  final String userNameHint = 'Enter your username';
  final String userNameHelper =
      'Use 3–30 characters: lowercase letters, numbers, dots and underscores. You can change it once every 30 days.';

  final String bioHint = 'Write a short bio';
  final String bioHelper =
      'Write a short intro about yourself. Your bio is visible on your profile.';

  final String genderHint = 'Select your gender';
  final String genderHelper =
      'This is private and only used to personalize your experience.';

  final String birthdayHint = 'Select your birthday';
  final String birthdayHelper =
      'This is private. We use it to confirm your age.';

  final String emailHelper =
      'We\'ll send a verification link to this address. Your current email stays active until you confirm.';

  final String phoneHelper =
      'Enter your number without the leading 0. We\'ll send a 6-digit code by SMS to confirm it.';
}
