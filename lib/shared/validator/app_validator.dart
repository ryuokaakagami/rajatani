import 'field_validator.dart';
import 'rules/email_validator.dart';
import 'rules/otp_validator.dart';
import 'rules/phone_validator.dart';
import 'rules/required_validator.dart';

class AppValidator {
  const new _();

  static final email = CompositeValidator(
    validators: [
      RequiredValidator(fieldName: 'Alamat email'),
      EmailValidator(),
    ],
  );

  static final phone = CompositeValidator(
    validators: [
      RequiredValidator(fieldName: 'Nomor handphone'),
      PhoneValidator(),
    ],
  );

  static final otp = CompositeValidator(
    validators: [
      RequiredValidator(fieldName: 'Kode verifikasi'),
      OtpValidator(),
    ],
  );
}
