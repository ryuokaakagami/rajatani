import '../../constant/app_regex.dart';
import '../field_validator.dart';

class EmailValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!AppRegex.emailRegex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }
}
