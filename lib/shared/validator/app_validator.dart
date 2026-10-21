import 'field_validator.dart';
import 'rules/email_validator.dart';
import 'rules/min_length_validator.dart';
import 'rules/otp_validator.dart';
import 'rules/phone_validator.dart';
import 'rules/required_validator.dart';

class AppValidator {
  const new _();

  static final email = CompositeValidator(
    validators: [
      RequiredValidator(fieldName: 'Email address'),
      EmailValidator(),
    ],
  );

  static final phone = CompositeValidator(
    validators: [
      RequiredValidator(fieldName: 'Phone number'),
      PhoneValidator(),
    ],
  );

  static final otp = CompositeValidator(
    validators: [
      RequiredValidator(fieldName: 'Verification code'),
      OtpValidator(),
    ],
  );

  static final username = CompositeValidator(
    validators: [
      RequiredValidator(fieldName: 'Username'),
      MinLengthValidator(fieldName: 'Username', length: 3),
    ],
  );
}
