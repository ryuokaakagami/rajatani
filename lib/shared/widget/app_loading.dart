import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constant/icon_size.dart';
import '../constant/spacing_size.dart';
import '../theme/app_theme.dart';

class AppLoading extends StatelessWidget {
  final Color? color;
  final double? size, spacing;
  final String? label;
  final bool hasLabel;

  const new({super.key, this.color, this.size})
    : label = null,
      spacing = null,
      hasLabel = false;

  const new withLabel({
    super.key,
    this.color,
    this.size,
    this.spacing,
    this.label,
  }) : hasLabel = true;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    final loading = LoadingAnimationWidget.hexagonDots(
      color: color ?? scheme.onSurfaceVariant,
      size: IconSize.xs,
    );

    if (hasLabel) {
      return Row(
        mainAxisSize: .min,
        spacing: spacing ?? SpacingSize.md,
        children: [
          loading,

          Text(
            label ?? 'Loading...',
            style: textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      );
    }

    return loading;
  }
}
