import 'package:flutter/material.dart';

import '../../../../../shared/validator/app_validator.dart';
import '../../../../../shared/widget/button/button.dart';
import '../../../../../shared/widget/field/field.dart';
import '../../../constants/auth_string.dart';
import '../../widgets/auth_form.dart';

class SignInVerificationForm extends StatefulWidget {
  final ValueChanged<String>? verifySignIn;
  final bool isLoading, isOtherLoading;

  const new({super.key, this.verifySignIn, required this.isLoading, required this.isOtherLoading});

  @override
  State<SignInVerificationForm> createState() => _SignInVerificationFormState();
}

class _SignInVerificationFormState extends State<SignInVerificationForm> {
  final _key = GlobalKey<FormState>();
  final _otpCtrl = TextEditingController();
  final _validator = AppValidator.otp;

  bool get isLoading => widget.isLoading;
  bool get isDisabled => widget.isOtherLoading;

  void _handleVerify() {
    final isValid = _key.currentState?.validate() ?? false;
    if (isValid) widget.verifySignIn?.call(_otpCtrl.text.trim());
  }

  @override
  void dispose() {
    _otpCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formKey: _key,
      children: [
        AppField.otp(
          onSubmitted: (_) => _handleVerify(),
          controller: _otpCtrl,
          validator: _validator.call,
          isLoading: isLoading || isDisabled,
        ),

        AppButton(
          onPressed: _handleVerify,
          isLoading: isLoading,
          isDisabled: isDisabled,
          label: AuthString.verification.buttonVerifyLabel,
        ),
      ],
    );
  }
}
