import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/shared.dart';
import '../../constants/auth_string.dart';
import '../cubit/sign_in_mode/sign_in_mode_cubit.dart';

class AuthModeSwitcher extends StatelessWidget {
  final Duration duration;
  final Widget child;

  const new({
    super.key,
    this.duration = const Duration(milliseconds: 350),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child,
    );
  }
}

class AuthButtonModeSwitcher extends StatelessWidget {
  final bool isLoading;

  const new({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final isPhoneMode = context.watch<SignInModeCubit>().state.isPhoneMode;
    final onPressed = context.read<SignInModeCubit>().changeMode;

    return AuthModeSwitcher(
      child: AppButton.outlined(
        key: ValueKey<bool>(isPhoneMode),
        onPressed: onPressed,
        isDisabled: isLoading,
        icon: isPhoneMode ? AppIcon.email : AppIcon.phone,
        label: isPhoneMode
            ? AuthString.signIn.buttonEmailLabel
            : AuthString.signIn.buttonPhoneLabel,
      ),
    );
  }
}
