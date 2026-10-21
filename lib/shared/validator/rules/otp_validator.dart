import '../field_validator.dart';

class OtpValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < 6) {
      return 'Please complete the 6-digit verification code';
    }
    return null;
  }
}
