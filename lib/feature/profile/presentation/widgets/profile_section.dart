import 'package:flutter/material.dart';

import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/theme/app_theme.dart';

class ProfileSection extends StatelessWidget {
  final String title;
  final Widget menu;

  const new({super.key, required this.title, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      spacing: SpacingSize.sm,
      crossAxisAlignment: .start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: .w600),
        ),

        menu,
      ],
    );
  }
}
