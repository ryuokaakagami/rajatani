import 'package:flutter/material.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../../../shared/constant/icon_size.dart';
import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../../../shared/widget/button/button.dart';
import '../../../../shared/widget/menu/menu.dart';
import '../../constants/profile_string.dart';

class CardCreateStore extends StatelessWidget {
  final VoidCallback? onPressed;

  const new({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    return AppMenu.box(
      boxPadding: const .all(SpacingSize.lg),
      children: [
        Icon(
          Iconsax.building_3_outline,
          color: scheme.primary,
          size: IconSize.lg,
        ),

        Text(
          ProfileString.main.createStoreTitle,
          style: textTheme.titleMedium?.copyWith(fontWeight: .w700),
        ),

        Text(
          ProfileString.main.createStoreDesc,
          style: textTheme.bodyMedium?.copyWith(color: scheme.onSurface),
          textAlign: .center,
        ),

        AppButton(
          onPressed: onPressed,
          icon: Iconsax.add_outline,
          label: ProfileString.main.buttonCreateStoreLabel,
        ),
      ],
    );
  }
}
