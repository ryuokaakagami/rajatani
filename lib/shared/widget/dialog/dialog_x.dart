part of 'dialog.dart';

extension DialogX on BuildContext {
  Future<void> dialogInfo({required String title, required String message}) {
    return showDialog<void>(
      context: this,
      builder: (ctx) => AppDialog.build(
        context: ctx,
        title: title,
        message: message,
        icon: Iconsax.information_outline,
        iconColor: scheme.info,
        actions: [AppButton.ghost(onPressed: () => ctx.pop(), label: 'OK')],
      ),
    );
  }

  Future<void> dialogConfirmation({
    required String title,
    required String message,
    required String confirmText,
    required VoidCallback onConfirm,
    bool isLoading = false,
    bool? barrierDisabled,
  }) {
    return showDialog<void>(
      context: this,
      barrierDismissible: barrierDisabled ?? false,
      builder: (ctx) => AppDialog.build(
        context: ctx,
        title: title,
        message: message,
        icon: Iconsax.message_question_outline,
        iconColor: scheme.primary,
        actions: [
          AppButton.ghost(
            isDisabled: isLoading,
            onPressed: () => ctx.pop(),
            label: 'Cancel',
            foregroundColor: scheme.onSurfaceVariant,
          ),
          const SizedBox(width: SpacingSize.sm),
          AppButton(
            onPressed: onConfirm,
            label: confirmText,
            isLoading: isLoading,
            minimumSize: const Size(.0, ButtonSize.sm),
          ),
        ],
      ),
    );
  }

  Future<void> dialogDestructive({
    required String title,
    required String message,
    required String destructiveText,
    required VoidCallback onConfirm,
    bool isLoading = false,
    bool? barrierDisabled,
  }) {
    return showDialog<void>(
      context: this,
      barrierDismissible: barrierDisabled ?? false,
      builder: (ctx) => AppDialog.build(
        context: ctx,
        title: title,
        message: message,
        icon: Iconsax.warning_2_outline,
        iconColor: scheme.error,
        actions: [
          AppButton.ghost(
            isDisabled: isLoading,
            onPressed: () => ctx.pop(),
            label: 'Cancel',
            foregroundColor: scheme.onSurfaceVariant,
          ),
          const SizedBox(width: SpacingSize.sm),
          AppButton(
            onPressed: onConfirm,
            label: destructiveText,
            backgroundColor: scheme.error,
            isLoading: isLoading,
            minimumSize: const Size(.0, ButtonSize.sm),
          ),
        ],
      ),
    );
  }
}
