import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widget/widget.dart';
import '../cubit/verification/sign_in_verification_cubit.dart';
import '../form/verification/sign_in_verification_form.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_layout.dart';

class SignInVerificationScreen extends StatelessWidget {
  final String contact;
  final bool isPhoneMode;

  const new({super.key, required this.contact, required this.isPhoneMode});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInVerificationCubit>();
    return BlocConsumer<SignInVerificationCubit, SignInVerificationState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (contact, action, isPhoneMode) {
            if (action == .resend) {
              context.read<ResendTimerCubit>().start();
              return;
            }
          },
          error: (message) => context.snackBarError(message),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return AuthLayout(
          children: [
            AuthHeader.verification(contact: contact, isPhoneMode: isPhoneMode),
            SignInVerificationForm(
              verifySignIn: (value) {
                cubit.verify(
                  contact: contact,
                  otp: value,
                  isPhoneMode: isPhoneMode,
                );
              },
              isLoading: state.isVerifyLoading,
              isOtherLoading: state.isResendLoading,
            ),

            const OrDivider(),

            ResendCode(
              onPressed: () {
                cubit.resend(contact: contact, isPhoneMode: isPhoneMode);
              },
              isLoading: state.isResendLoading,
              isOtherLoading: state.isVerifyLoading,
            ),
          ],
        );
      },
    );
  }
}
