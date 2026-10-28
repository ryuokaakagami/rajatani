import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/cubit/user/user_cubit.dart';
import '../../../../shared/widget/dialog/dialog_x.dart';
import '../../../../shared/widget/snackbar/snackbar.dart';
import '../cubit/avatar/avatar_cubit.dart';
import '../cubit/edit/profile_edit_cubit.dart';

extension ProfileEditListenerX on BuildContext {
  void handleProfileEditState({
    required ProfileEditState state,
    required String userId,
  }) {
    state.maybeWhen(
      success: () {
        read<UserCubit>().fetch(userId);
        pop();
      },
      error: (message) => snackBarError(message),
      orElse: () {},
    );
  }

  Future<void> handleAvatarState({
    required AvatarState state,
    required String userId,
    bool popOnSuccess = false,
  }) async {
    await state.maybeWhen(
      success: () async {
        read<UserCubit>().fetch(userId);
        if (popOnSuccess) pop();
      },
      error: (message, retryable) async {
        if (!retryable) {
          snackBarError(message);
          return;
        }

        final retry = await dialogRetry(
          title: 'Upload failed',
          message: message,
        );
        if (!mounted) return;

        final avatar = read<AvatarCubit>();
        retry ? avatar.retry() : avatar.cancel();
      },
      orElse: () async {},
    );
  }
}
