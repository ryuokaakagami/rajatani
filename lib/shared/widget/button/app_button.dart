part of 'button.dart';

class AppButton extends StatelessWidget {
  final _ButtonType _type;
  final FloatingType? type;
  final VoidCallback? onPressed;
  final bool isLoading, isDisabled, isMinimized;
  final String? imageAsset, label;
  final IconData? icon;
  final Color? backgroundColor, foregroundColor;
  final double? iconSize, elevation;
  final Size? minimumSize;
  final Object? heroTag;
  final ShapeBorder? shape;

  const new({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isMinimized = false,
    this.imageAsset,
    this.label,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.minimumSize,
  }) : _type = .filled,
       type = null,
       iconSize = null,
       elevation = null,
       heroTag = null,
       shape = null;

  const new outlined({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isMinimized = false,
    this.imageAsset,
    this.label,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.minimumSize,
  }) : _type = .outlined,
       type = null,
       iconSize = null,
       elevation = null,
       heroTag = null,
       shape = null;

  const new ghost({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.imageAsset,
    this.label,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.iconSize,
  }) : _type = .ghost,
       isMinimized = false,
       type = null,
       elevation = null,
       minimumSize = null,
       heroTag = null,
       shape = null;

  const new floating({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.imageAsset,
    this.label,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.iconSize,
    this.type,
    this.heroTag,
    this.shape,
    this.elevation,
  }) : _type = .floating,
       isMinimized = false,
       minimumSize = null;

  @override
  Widget build(BuildContext context) {
    final onAction = !isLoading && !isDisabled ? onPressed : null;
    final scheme = context.scheme;
    final resolvedSize =
        minimumSize ?? (isMinimized ? null : Size.fromHeight(ButtonSize.lg));

    final defaultLoadingColor = _type == .filled
        ? scheme.onPrimary
        : _type == .ghost
        ? scheme.primary
        : scheme.onSurfaceVariant;

    final child = _ButtonChild(
      isLoading: isLoading,
      loadingColor: (foregroundColor ?? defaultLoadingColor).withValues(
        alpha: .38,
      ),
      imageAsset: imageAsset,
      label: label,
      icon: icon,
      iconSize: iconSize,
    );

    return switch (_type) {
      .ghost => _GhostButton(
        onPressed: onAction,
        background: backgroundColor,
        foreground: foregroundColor,
        child: child,
      ),

      .outlined => _OutlinedButton(
        onPressed: onAction,
        background: backgroundColor,
        foreground: foregroundColor,
        minimumSize: resolvedSize,
        child: child,
      ),

      .floating => _FloatingButton(
        onPressed: onAction,
        background: backgroundColor,
        foreground: foregroundColor,
        heroTag: heroTag,
        type: type ?? .standart,
        isLoading: isLoading,
        isDisabled: isDisabled,
        shape: shape,
        elevation: elevation,
        child: child,
      ),

      _ => _FilledButton(
        onPressed: onAction,
        background: backgroundColor,
        foreground: foregroundColor,
        minimumSize: resolvedSize,
        child: child,
      ),
    };
  }
}
