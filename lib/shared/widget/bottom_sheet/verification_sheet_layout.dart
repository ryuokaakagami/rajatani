part of 'bottom_sheet.dart';

class VerificationSheetLayout extends StatelessWidget {
  final Object? stepKey;
  final Widget? indicator;
  final ValueChanged<String>? verify;
  final VoidCallback? resend;
  final bool isVerifyLoading, isResendLoading, isOtherLoading;
  final String subtitle;
  final String? actionLabel;

  const new({
    super.key,
    this.stepKey,
    this.indicator,
    this.verify,
    this.resend,
    required this.isVerifyLoading,
    required this.isResendLoading,
    required this.isOtherLoading,
    required this.subtitle,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    void cancelVerification() {
      context.dialogConfirmation(
        title: AppString.cancelVerificationTitle,
        message: AppString.cancelVerificationMessage,
        confirmText: AppString.cancelVerificationConfirm,
        cancelText: AppString.stay,
        onConfirm: () {
          final nav = Navigator.of(context, rootNavigator: true);
          nav.pop();
          nav.pop(false);
        },
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop || isOtherLoading) return;
        cancelVerification();
      },
      child: Padding(
        padding: const .symmetric(
          horizontal: SpacingSize.xl,
          vertical: SpacingSize.xxl,
        ),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          spacing: SpacingSize.lg,
          children: [
            _VerificationSheetHeader(
              cancel: cancelVerification,
              disabledCancel: isOtherLoading,
              subtitle: subtitle,
            ),

            ?indicator,

            _VerificationSheetContent(
              key: ValueKey(stepKey),
              isLoading: isVerifyLoading,
              isOtherLoading: isOtherLoading,
              verify: verify,
            ),
            Align(
              alignment: .bottomCenter,
              child: _VerificationSheetFooter(
                onPressed: resend,
                isLoading: isResendLoading,
                isOtherLoading: isOtherLoading,
                actionLabel: actionLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerificationSheetHeader extends StatelessWidget {
  final VoidCallback? cancel;
  final bool disabledCancel;
  final String subtitle;

  const new({
    this.cancel,
    required this.disabledCancel,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: .start,
      spacing: SpacingSize.md,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              spacing: SpacingSize.md,
              children: [
                Image.asset(IconAsset.send, width: IconSize.md),
                Text(
                  AppString.verification,
                  style: textTheme.headlineSmall?.copyWith(
                    color: scheme.primary,
                    fontWeight: .w600,
                  ),
                ),
              ],
            ),

            AppButton.ghost(
              onPressed: cancel,
              isDisabled: disabledCancel,
              foregroundColor: scheme.error,
              label: AppString.cancel,
            ),
          ],
        ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Text(
            subtitle,
            key: ValueKey(subtitle),
            style: textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _VerificationSheetContent extends StatefulWidget {
  final ValueChanged<String>? verify;
  final bool isLoading, isOtherLoading;

  const new({
    super.key,
    this.verify,
    required this.isLoading,
    required this.isOtherLoading,
  });

  @override
  State<_VerificationSheetContent> createState() =>
      _VerificationSheetContentState();
}

class _VerificationSheetContentState extends State<_VerificationSheetContent> {
  final _key = GlobalKey<FormState>();
  final _otpCtrl = TextEditingController();
  final _validator = AppValidator.otp;

  bool get isLoading => widget.isLoading;
  bool get isDisabled => widget.isOtherLoading;

  void _handleVerify() {
    final isValid = _key.currentState?.validate() ?? false;
    if (isValid) widget.verify?.call(_otpCtrl.text.trim());
  }

  @override
  void dispose() {
    _otpCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisSize: .min,
        spacing: SpacingSize.lg,
        children: [
          AppField.otp(
            onSubmitted: (_) => _handleVerify(),
            controller: _otpCtrl,
            validator: _validator.call,
            isDisabled: isLoading || isDisabled,
          ),

          AppButton(
            onPressed: _handleVerify,
            isLoading: isLoading,
            isDisabled: isDisabled,
            label: AppString.verify,
          ),
        ],
      ),
    );
  }
}

class _VerificationSheetFooter extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading, isOtherLoading;
  final String? actionLabel;

  const new({
    this.onPressed,
    required this.isLoading,
    required this.isOtherLoading,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      spacing: SpacingSize.lg,
      children: [
        const OrDivider(),
        ResendCode(
          isLoading: isLoading,
          isOtherLoading: isOtherLoading,
          onPressed: onPressed,
          actionLabel: actionLabel,
        ),
      ],
    );
  }
}
