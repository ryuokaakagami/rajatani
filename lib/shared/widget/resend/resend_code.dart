import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/constant/spacing_size.dart';
import '../../../../../shared/extension/timer_x.dart';
import '../../../../../shared/theme/app_theme.dart';
import '../../../../../shared/widget/button/button.dart';
import '../../constant/app_string.dart';
import 'cubit/resend_timer_cubit.dart';

class ResendCode extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading, isOtherLoading;
  final String? actionLabel;

  const new({
    super.key,
    this.onPressed,
    required this.isLoading,
    required this.isOtherLoading,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;
    return BlocBuilder<ResendTimerCubit, ResendTimerState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: .min,
          spacing: SpacingSize.sm,
          children: [
            Text(
              AppString.didntReceive,
              style: textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),

            AppButton.ghost(
              onPressed: onPressed,
              isLoading: isLoading,
              isDisabled: isOtherLoading || !state.canResend,
              label: state.canResend
                  ? actionLabel ?? AppString.resendNow
                  : state.remaining.toMmSs,
            ),
          ],
        );
      },
    );
  }
}
