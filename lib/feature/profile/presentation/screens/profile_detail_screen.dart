import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/console.dart';
import '../../../../shared/shared.dart';
import '../../constants/profile_string.dart';
import '../../extensions/profile_photo_x.dart';
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
    void changedPhoto() async {
      final path = await context.pickPhotoProfile();
      if (path == null || !context.mounted) return;
      Console.info(message: path);
    }

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final data = state.data;
        return ProfileLayout(
          titleAppBar: data?.username,
          children: [
            _Header(
              onTapAvatar: () {
                if (data?.avatarUrl != null) {
                  context.pushNamed(
                    RoutesConstant.names.photoProfile,
                    extra: {'id': data?.id, 'avatarUrl': data?.avatarUrl},
                  );
                  return;
                }
                changedPhoto();
              },
              onTapBadge: () {
                changedPhoto();
              },
              imageUrl: data?.avatarUrl,
              heroTag: data?.id,
              rating: data?.rating,
              totalReview: data?.totalReviews,
            ),

            _PersonalSection(
              onTapFullname: () {
                context.pushNamed(
                  RoutesConstant.names.editNameProfile,
                  extra: {'id': data?.id, 'name': data?.fullname},
                );
              },
              onTapUsername: () {
                context.pushNamed(
                  RoutesConstant.names.editUsernameProfile,
                  extra: {
                    'id': data?.id,
                    'username': data?.username,
                    'username_updated_at': data?.usernameUpdatedAt,
                  },
                );
              },
              onTapBio: () {
                context.pushNamed(
                  RoutesConstant.names.editBioProfile,
                  extra: {'id': data?.id, 'bio': data?.bio},
                );
              },
              onTapGender: () {
                context.pushNamed(
                  RoutesConstant.names.editGenderProfile,
                  extra: {'id': data?.id, 'gender': data?.gender},
                );
              },
              onTapBirthday: () {
                context.pushNamed(
                  RoutesConstant.names.editBirthdayProfile,
                  extra: {'id': data?.id, 'birthday': data?.birthday},
                );
              },
              fullname: data?.fullname,
              username: data?.username,
              bio: data?.bio,
              gender: data?.gender?.label,
              birthday: data?.birthday,
            ),

            _ContactSection(
              onTapEmail: () {
                context.pushNamed(RoutesConstant.names.editEmailProfile);
              },
              onTapPhone: () {
                context.pushNamed(RoutesConstant.names.editPhoneProfile);
              },
              email: data?.email,
              phone: data?.phone,
            ),
          ],
        );
      },
    );
  }
}
