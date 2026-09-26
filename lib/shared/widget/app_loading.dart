import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constant/icon_size.dart';
import '../theme/app_theme.dart';

class AppLoading extends StatelessWidget {
  final Color? color;
  final double? size;

  const new({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return LoadingAnimationWidget.hexagonDots(
      color: color ?? scheme.onSurfaceVariant,
      size: IconSize.xs,
    );
  }
}
