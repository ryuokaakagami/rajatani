import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../../../config/routes/constants/routes_constant.dart';
import '../../../../shared/shared.dart';
import '../../constants/profile_string.dart';
import '../widgets/card_create_store.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_layout.dart';
import '../widgets/profile_section.dart';

part '../widgets/main/_header.dart';
part '../widgets/main/_account_section.dart';
part '../widgets/main/_transaction_section.dart';
part '../widgets/main/_selling_section.dart';
part '../widgets/main/_help_section.dart';

class ProfileScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    void onTapDetailProfile() {
      context.pushNamed(RoutesConstant.names.detailProfile);
    }

    return ProfileLayout(
      children: [
        _Header(
          onTapAvatar: onTapDetailProfile,
          imageUrl: 'https://asset.kompas.com/crops/8n6IC4_F90HNnpnDUfEvrTjnuvM=/0x0:0x0/1200x800/data/photo/2023/12/06/65707bd720215.jpeg',
          fullname: 'Laura Basuki',
          username: 'laurabas',
          heroTag: 'profile-tag',
        ),

        _AccountSection(
          onTapDetail: onTapDetailProfile,
          onTapDelivery: () {},
          onTapPrivacy: () {},
        ),

        _TransactionSection(onTapOrder: () {}),

        _SellingSection(onTapCreateStore: () {}),

        _HelpSection(
          onTapService: () {},
          onTapSetting: () {},
          onTapLogOut: () async => await context.dialogLogOut(),
        ),
      ],
    );
  }
}
