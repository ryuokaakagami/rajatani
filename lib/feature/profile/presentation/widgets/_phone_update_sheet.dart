part of '../extensions/verify_contact_update_x.dart';

class _PhoneUpdateSheet extends StatelessWidget {
  final String newPhone;
  final BlocWidgetListener<ContactUpdateState> listener;

  const new({required this.newPhone, required this.listener});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactUpdateCubit>();

    return BlocConsumer<ContactUpdateCubit, ContactUpdateState>(
      listener: listener,
      builder: (context, state) => VerificationSheetLayout(
        verify: (otp) {
          cubit.verify(otp: otp, contact: newPhone, isPhone: true);
        },
        resend: () => cubit.resend(contact: newPhone, isPhone: true),
        isVerifyLoading: state.isVerifyLoading,
        isResendLoading: state.isResendLoading,
        isOtherLoading: state.isLoading,
        subtitle: ProfileString.contact.subtitlePhone(newPhone),
      ),
    );
  }
}
