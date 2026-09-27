import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/constants/routes_constant.dart';
import '../../../../shared/constant/constant.dart';
import '../../../../shared/widget/button/button.dart';
import '../../../../shared/widget/snackbar/snackbar.dart';
import '../../constants/auth_string.dart';
import '../cubit/sign_in/sign_in_cubit.dart';
import '../cubit/sign_in_mode/sign_in_mode_cubit.dart';
import '../form/sign_in/sign_in_form.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_layout.dart';
import '../widgets/auth_mode_switcher.dart';
import '../widgets/or_divider.dart';

class SignInScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (method, contact) {
            if (method == .form) {
              final isPhoneMode = context.read<SignInModeCubit>().state.isPhoneMode;
              context.pushNamed(
                RoutesConstant.names.signInVerification,
                extra: (contact, isPhoneMode),
              );
            }
          },
          error: (message) => context.snackBarError(message),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return AuthLayout(
          children: [
            const AuthHeader.signIn(),

            SignInForm(
              signInWithEmail: cubit.signInWithEmail,
              signInWithPhone: cubit.signInWithPhone,
              isLoading: state.isFormLoading,
              isOtherLoading: state.isGoogleLoading,
            ),

            const OrDivider(),

            AuthButtonModeSwitcher(isLoading: state.isFormLoading || state.isGoogleLoading),

            AppButton.outlined(
              onPressed: cubit.signInWithGoogle,
              isLoading: state.isGoogleLoading,
              isDisabled: state.isFormLoading,
              imageAsset: IconAsset.google,
              label: AuthString.signIn.buttonGoogleLabel,
            ),
          ],
        );
      },
    );
  }
}
