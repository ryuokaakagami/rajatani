import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/extension/timer_x.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../../../shared/widget/button/button.dart';
import '../../auth.dart';
import '../../constants/auth_string.dart';

class ResendCode extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading, isOtherLoading;

  const new({super.key, this.onPressed, required this.isLoading, required this.isOtherLoading});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;
    return BlocBuilder<ResendTimerCubit, ResendTimerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: .center,
          spacing: SpacingSize.sm,
          children: [
            Text(
              AuthString.verification.didntReceive,
              style: textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
            ),

            AppButton.ghost(
              onPressed: onPressed,
              isLoading: isLoading,
              isDisabled: isOtherLoading || !state.canResend,
              label: state.canResend ? AuthString.verification.resendNow : state.remaining.toMmSs,
            ),
          ],
        );
      },
    );
  }
}
