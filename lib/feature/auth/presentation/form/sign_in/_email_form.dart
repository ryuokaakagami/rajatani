part of 'sign_in_form.dart';

class _EmailForm extends StatefulWidget {
  final ValueChanged<String>? onSignIn;
  final bool isLoading, isOtherLoading;

  const new({
    this.onSignIn,
    required this.isLoading,
    required this.isOtherLoading,
  });

  @override
  State<_EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<_EmailForm> {
  final _key = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _validator = AppValidator.email;

  bool get isLoading => widget.isLoading;
  bool get isDisbaled => widget.isOtherLoading;

  void _handleSignIn() {
    final isValid = _key.currentState?.validate() ?? false;
    if (isValid) widget.onSignIn?.call(_emailCtrl.text.trim());
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formKey: _key,
      children: [
        AppField(
          onSubmitted: (_) => _handleSignIn(),
          controller: _emailCtrl,
          validator: _validator.call,
          isDisabled: isLoading || isDisbaled,
          hintText: AppString.emailHint,
          prefixIcon: Icon(AppIcon.email),
          label: AppString.emailLabel,
          type: .emailAddress,
        ),

        AppButton(
          onPressed: _handleSignIn,
          isLoading: isLoading,
          isDisabled: isDisbaled,
          label: AuthString.signIn.buttonEmailLabel,
        ),
      ],
    );
  }
}
