import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/service/locator.dart';
import '../../../../shared/shared.dart';
import '../cubit/avatar/avatar_cubit.dart';
import '../extensions/profile_edit_x.dart';
import '../extensions/profile_photo_x.dart';

class ProfilePhotoScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.userOrNull;
    final scheme = Scheme.dark();

    return BlocConsumer<AvatarCubit, AvatarState>(
      listener: (context, state) {
        final loading = sl<LoadingDialogController>();
        state.isLoading ? loading.show() : loading.hide();
        context.handleAvatarState(
          state: state,
          userId: data?.id ?? '',
          popOnSuccess: true,
        );
      },
      listenWhen: (prev, curr) => prev != curr,
      builder: (context, state) {
        return ImageViewer(
          imageUrl: data?.avatarUrl,
          heroTag: data?.id,
          appBar: AppBar(
            foregroundColor: scheme.onBackground,
            backgroundColor: Colors.transparent,
            title: const Text('Photo profile'),
            actions: [
              AppButton.ghost(
                onPressed: () async => await context.changePhotoProfile(
                  userId: data?.id ?? '',
                  oldPath: data?.avatarPath,
                  showDelete: data?.avatarUrl != null,
                ),
                icon: Icons.edit,
                iconSize: IconSize.sm,
                foregroundColor: scheme.onBackground,
              ),
              const SizedBox(width: SpacingSize.lg),
              AppButton.ghost(
                onPressed: () {},
                icon: Icons.share,
                iconSize: IconSize.sm,
                foregroundColor: scheme.onBackground,
              ),
            ],
          ),
        );
      },
    );
  }
}
