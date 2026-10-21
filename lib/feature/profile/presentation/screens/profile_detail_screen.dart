import 'package:flutter/material.dart';
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
    return ProfileLayout(
      titleAppBar: 'laurabas',
      children: [
        _Header(
          onTapAvatar: () {
            context.pushNamed(RoutesConstant.names.photoProfile);
          },
          onTapBadge: () async {
            final path = await context.pickPhotoProfile();
            if (path == null || !context.mounted) return;
            Console.info(message: path);
          },
          imageUrl: 'https://asset.kompas.com/crops/8n6IC4_F90HNnpnDUfEvrTjnuvM=/0x0:0x0/1200x800/data/photo/2023/12/06/65707bd720215.jpeg',
          heroTag: 'profile-tag',
          rating: .00,
          totalReview: 0,
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
          fullname: 'Laura Basuki',
          username: 'laurabas',
          bio: '-',
          gender: 'Female',
          birthday: DateTime(1988, 1, 9),
        ),

        _ContactSection(
          onTapEmail: () {
            context.pushNamed(RoutesConstant.names.editEmailProfile);
          },
          onTapPhone: () {
            context.pushNamed(RoutesConstant.names.editPhoneProfile);
          },
          email: 'laurabas@gmail.com',
          phone: '08123456789',
        ),
      ],
    );
  }
}
