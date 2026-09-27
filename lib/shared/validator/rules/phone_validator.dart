import '../../constant/app_regex.dart';
import '../field_validator.dart';

class PhoneValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!AppRegex.phoneRegex.hasMatch(value)) {
      return 'Nomor handphone tidak valid';
    }
    return null;
  }
}
