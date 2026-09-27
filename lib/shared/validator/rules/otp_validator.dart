import '../validator.dart';

class OtpValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < 6) return 'Silakan lengkapi 6 digit kode verifikasi';
    return null;
  }
}
