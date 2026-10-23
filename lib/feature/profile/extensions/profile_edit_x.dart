import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/cubit/user/user_cubit.dart';
import '../../../shared/widget/snackbar/snackbar.dart';
import '../presentation/cubit/edit/profile_edit_cubit.dart';

extension ProfileEditListenerX on BuildContext {
  void handleProfileEditState({
    required ProfileEditState state,
    required String userId,
  }) {
    state.maybeWhen(
      success: () async {
        await read<UserCubit>().fetch(userId);
        if (mounted) {
          pop();
        }
      },
      error: (message) => snackBarError(message),
      orElse: () {},
    );
  }
}
