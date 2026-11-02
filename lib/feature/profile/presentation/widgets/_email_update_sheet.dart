part of '../extensions/verify_contact_update_x.dart';

class _EmailUpdateSheet extends StatelessWidget {
  final String oldEmail, newEmail;
  final BlocWidgetListener<ContactUpdateState> listener;
  const new({
    required this.oldEmail,
    required this.newEmail,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactUpdateCubit>();
    final isAdd = oldEmail.isEmpty;

    return BlocListener<ContactUpdateCubit, ContactUpdateState>(
      listener: listener,
      child: BlocBuilder<ContactUpdateCubit, ContactUpdateState>(
        buildWhen: (_, c) => c.isIncomplete || c.isRestarted,
        builder: (context, phase) {
          final isSecondStep = phase.isIncomplete;
          final isFinal = isAdd || isSecondStep;

          return BlocBuilder<ContactUpdateCubit, ContactUpdateState>(
            builder: (context, state) => VerificationSheetLayout(
              stepKey: ValueKey(isSecondStep),
              indicator: isAdd
                  ? null
                  : StepIndicator(current: isSecondStep ? 2 : 1, sum: 2),
              verify: (otp) => cubit.verify(
                otp: otp,
                contact: isAdd || isSecondStep ? newEmail : oldEmail,
                isPhone: false,
                isFinal: isFinal,
              ),
              resend: () {
                if (isAdd) {
                  cubit.resend(contact: newEmail, isPhone: false);
                  return;
                }

                if (!isSecondStep) {
                  cubit.resend(contact: oldEmail, isPhone: false);
                  return;
                }

                context.dialogConfirmation(
                  title: ProfileString.contact.titleRestartVerification,
                  message: ProfileString.contact.messageRestartVerification,
                  confirmText: ProfileString.contact.restart,
                  onConfirm: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    cubit.resend(
                      contact: oldEmail,
                      isPhone: false,
                      restart: true,
                    );
                  },
                );
              },
              isVerifyLoading: state.isVerifyLoading,
              isResendLoading: state.isResendLoading,
              isOtherLoading: state.isLoading,
              subtitle: isAdd
                  ? ProfileString.contact.subtitleAdd(newEmail)
                  : isSecondStep
                  ? ProfileString.contact.subtitleChangeNew(newEmail)
                  : ProfileString.contact.subtitleChangeOld(oldEmail),
              actionLabel: isSecondStep ? ProfileString.contact.restart : null,
            ),
          );
        },
      ),
    );
  }
}
