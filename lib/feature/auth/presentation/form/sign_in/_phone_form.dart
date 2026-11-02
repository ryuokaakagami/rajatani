part of 'sign_in_form.dart';

class _PhoneForm extends StatefulWidget {
  final ValueChanged<String>? onSignIn;
  final bool isLoading, isOtherLoading;

  const new({
    this.onSignIn,
    required this.isLoading,
    required this.isOtherLoading,
  });

  @override
  State<_PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<_PhoneForm> {
  final _key = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController();
  final _validator = AppValidator.phone;

  bool get isLoading => widget.isLoading;
  bool get isDisbaled => widget.isOtherLoading;

  void _handleSignIn() {
    final isValid = _key.currentState?.validate() ?? false;
    if (isValid) {
      widget.onSignIn?.call(_phoneCtrl.text.toCleanSpace.normalizePhone);
    }
  }

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formKey: _key,
      children: [
        AppField(
          onSubmitted: (_) => _handleSignIn(),
          controller: _phoneCtrl,
          validator: _validator.call,
          isDisabled: isLoading || isDisbaled,
          hintText: AppString.phoneHint,
          prefixIcon: Icon(AppIcon.phone),
          label: AppString.phoneLabel,
          type: .phone,
          formatters: [FilteringTextInputFormatter.digitsOnly],
        ),

        AppButton(
          onPressed: _handleSignIn,
          isLoading: isLoading,
          isDisabled: isDisbaled,
          label: AuthString.signIn.buttonPhoneLabel,
        ),
      ],
    );
  }
}
