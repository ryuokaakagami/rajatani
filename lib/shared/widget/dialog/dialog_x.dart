import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../constant/app_string.dart';
import '../../constant/button_size.dart';
import '../../constant/icon_size.dart';
import '../../constant/spacing_size.dart';
import '../../cubit/session/session_cubit.dart';
import '../../theme/app_theme.dart';
import '../app_loading.dart';
import '../button/button.dart';

part 'app_dialog.dart';

extension DialogX on BuildContext {
  Future<void> dialogInfo({required String title, required String message}) {
    return showDialog<void>(
      context: this,
      builder: (ctx) => AppDialog.build(
        title: title,
        message: message,
        icon: Iconsax.information_outline,
        iconColor: scheme.info,
        actions: [
          AppButton.ghost(
            onPressed: () => Navigator.of(ctx).pop(),
            label: AppString.ok,
          ),
        ],
      ),
    );
  }

  Future<void> dialogConfirmation({
    required String title,
    required String message,
    required String confirmText,
    required VoidCallback onConfirm,
    String cancelText = 'Cancel',
    bool isLoading = false,
    bool? barrierDisabled,
  }) {
    return showDialog<void>(
      context: this,
      barrierDismissible: barrierDisabled ?? false,
      builder: (ctx) => AppDialog.build(
        title: title,
        message: message,
        icon: Iconsax.message_question_outline,
        iconColor: scheme.primary,
        actions: [
          AppButton.ghost(
            isDisabled: isLoading,
            onPressed: () => Navigator.of(ctx).pop(),
            label: cancelText,
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
        title: title,
        message: message,
        icon: Iconsax.warning_2_outline,
        iconColor: scheme.error,
        actions: [
          AppButton.ghost(
            isDisabled: isLoading,
            onPressed: () => Navigator.of(ctx).pop(),
            label: AppString.cancel,
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

  Future<bool> dialogRetry({
    required String title,
    required String message,
    String retryText = 'Retry',
  }) async {
    final result = await showDialog<bool>(
      context: this,
      barrierDismissible: false,
      builder: (ctx) => AppDialog.build(
        title: title,
        message: message,
        icon: Iconsax.warning_2_outline,
        iconColor: scheme.warning,
        actions: [
          AppButton.ghost(
            onPressed: () => Navigator.of(ctx).pop(false),
            label: AppString.cancel,
            foregroundColor: scheme.onSurfaceVariant,
          ),
          const SizedBox(width: SpacingSize.sm),
          AppButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            label: retryText,
            minimumSize: const Size(.0, ButtonSize.sm),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  Future<void> dialogLoading({String? title, String? message}) {
    return showDialog<void>(
      context: this,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => PopScope(
        canPop: false,
        child: AppDialog.buildLoading(title: title, message: message),
      ),
    );
  }

  Future<void> dialogLogOut() async {
    return await dialogDestructive(
      title: AppString.signOut,
      message: AppString.signOutMessage,
      destructiveText: AppString.signOut,
      onConfirm: read<SessionCubit>().signOut,
    );
  }
}
