import 'package:flutter/material.dart';

import '../constant/spacing_size.dart';
import '../theme/app_theme.dart';

class StepIndicator extends StatelessWidget {
  final int current, sum;

  const new({super.key, required this.current, required this.sum});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: .start,
      spacing: SpacingSize.sm,
      children: [
        Row(
          spacing: SpacingSize.sm,
          children: [
            for (var i = 1; i <= sum; i++)
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  height: 4,
                  decoration: BoxDecoration(
                    color: i <= current
                        ? scheme.primary
                        : scheme.onSurfaceVariant.withValues(alpha: .25),
                    borderRadius: .circular(2),
                  ),
                ),
              ),
          ],
        ),
        Text(
          'Step $current of $sum',
          style: textTheme.labelMedium?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
