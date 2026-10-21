part of 'menu.dart';

class _MenuItem extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String? title, subtitle;
  final Color? iconColor, titleColor, subtitleColor;
  final bool hasArrow;
  final EdgeInsets? padding;
  final BorderRadius? radius;

  const new({
    this.onTap,
    this.icon,
    this.title,
    this.subtitle,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
    required this.hasArrow,
    this.padding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: radius ?? .circular(RadiusSize.lg),
      child: Padding(
        padding: padding ?? const .all(SpacingSize.md),
        child: Row(
          spacing: SpacingSize.lg,
          children: [
            if (icon != null) Icon(icon, color: iconColor),

            _MenuInfo(
              title: title,
              subtitle: subtitle,
              titleColor: titleColor,
              subtitleColor: subtitleColor,
            ),

            if (hasArrow)
              Icon(Iconsax.arrow_right_3_outline, size: IconSize.xs),
          ],
        ),
      ),
    );
  }
}

class _MenuInfo extends StatelessWidget {
  final String? title, subtitle;
  final Color? titleColor, subtitleColor;

  const new({this.title, this.subtitle, this.titleColor, this.subtitleColor});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    final hasTitle = title != null && title!.isNotEmpty;
    final hasSubtitle = subtitle != null && subtitle!.isNotEmpty;

    final titleWidget = Text(
      title ?? '',
      style: textTheme.bodyLarge?.copyWith(
        fontWeight: .w600,
        color: titleColor ?? scheme.onSurface,
      ),
      maxLines: 1,
      overflow: .ellipsis,
    );

    final subtitleWidget = Text(
      subtitle ?? '',
      style: textTheme.bodyMedium?.copyWith(
        color: subtitleColor ?? scheme.onSurfaceVariant,
      ),
      maxLines: 1,
      overflow: .ellipsis,
    );

    return Expanded(
      child: hasTitle && hasSubtitle
          ? Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [titleWidget, subtitleWidget],
            )
          : hasTitle
          ? titleWidget
          : hasSubtitle
          ? subtitleWidget
          : const SizedBox.shrink(),
    );
  }
}
