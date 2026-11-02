import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/shared.dart';
import '../../constants/profile_string.dart';
import '../cubit/contact/contact_update_cubit.dart';

part '../widgets/_email_update_sheet.dart';
part '../widgets/_phone_update_sheet.dart';

extension VerifyContactUpdateX on BuildContext {
  void _onState(BuildContext context, ContactUpdateState state) {
    final timer = context.read<ResendTimerCubit>();

    if (state.isIncomplete || state.isRestarted) timer.start();

    state.maybeWhen(
      success: (action) {
        if (action == .resend) timer.start();
        if (action == .verify) Navigator.of(context).pop(true);
      },
      error: (message) => context.snackBarError(message),
      orElse: () {},
    );
  }

  Future<bool?> showVerifyContactUpdateSheet({
    String? oldContact,
    required String newContact,
    bool isPhone = false,
  }) {
    final cubit = read<ContactUpdateCubit>();
    return showVerifySheet(
      providers: [BlocProvider.value(value: cubit)],
      builder: (_) {
        return isPhone
            ? _PhoneUpdateSheet(listener: _onState, newPhone: newContact)
            : _EmailUpdateSheet(
                listener: _onState,
                oldEmail: oldContact ?? '',
                newEmail: newContact,
              );
      },
    );
  }
}
