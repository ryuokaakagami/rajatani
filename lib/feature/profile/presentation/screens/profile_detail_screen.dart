import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../../../config/routes/routes.dart';
import '../../../../config/service/locator.dart';
import '../../../../shared/shared.dart';
import '../../constants/profile_string.dart';
import '../cubit/avatar/avatar_cubit.dart';
import '../extensions/profile_edit_x.dart';
import '../extensions/profile_photo_x.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_layout.dart';
import '../widgets/profile_section.dart';

part '../widgets/detail/_header.dart';
part '../widgets/detail/_personal_section.dart';
part '../widgets/detail/_contact_section.dart';

class ProfileDetailScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.select((UserCubit c) => c.state.data!);

    void changedPhoto() async {
      await context.changePhotoProfile(
        userId: data.id,
        oldPath: data.avatarPath,
        showDelete: data.avatarUrl != null,
      );
    }

    return BlocConsumer<AvatarCubit, AvatarState>(
      listener: (context, state) {
        final loading = sl<LoadingDialogController>();
        state.isLoading ? loading.show() : loading.hide();
        context.handleAvatarState(state: state, userId: data.id);
      },
      listenWhen: (prev, curr) => prev != curr,
      builder: (context, state) {
        return ProfileLayout(
          titleAppBar: data.username,
          children: [
            _Header(
              onTapAvatar: () {
                if (data.avatarUrl != null) {
                  context.pushNamed(RoutesConstant.names.photoProfile);
                  return;
                }
                changedPhoto();
              },
              onTapBadge: () {
                changedPhoto();
              },
              imageUrl: data.avatarUrl,
              heroTag: data.id,
              rating: data.rating,
              totalReview: data.totalReviews,
            ),

            _PersonalSection(
              onTapFullname: () {
                context.pushNamed(RoutesConstant.names.editNameProfile);
              },
              onTapUsername: () {
                context.pushNamed(RoutesConstant.names.editUsernameProfile);
              },
              onTapBio: () {
                context.pushNamed(RoutesConstant.names.editBioProfile);
              },
              onTapGender: () {
                context.pushNamed(RoutesConstant.names.editGenderProfile);
              },
              onTapBirthday: () {
                context.pushNamed(RoutesConstant.names.editBirthdayProfile);
              },
              fullname: data.fullname,
              username: data.username,
              bio: data.bio,
              gender: data.gender?.label,
              birthday: data.birthday,
            ),

            _ContactSection(
              onTapEmail: () {
                context.pushNamed(RoutesConstant.names.editEmailProfile);
              },
              onTapPhone: () {
                context.pushNamed(RoutesConstant.names.editPhoneProfile);
              },
              email: data.email,
              phone: data.phone,
            ),
          ],
        );
      },
    );
  }
}
