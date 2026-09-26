import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class FooterWatermark extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;
    return Align(
      alignment: .bottomCenter,
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            'From',
            style: textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),

          Text(
            'Akagami',
            style: textTheme.bodyLarge?.copyWith(
              color: scheme.primary,
              fontWeight: .w600,
            ),
          ),
        ],
      ),
    );
  }
}
