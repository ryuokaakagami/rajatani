part of 'button.dart';

class _ButtonChild extends StatelessWidget {
  final bool isLoading;
  final Color? loadingColor;
  final String? imageAsset, label;
  final IconData? icon;
  final double? iconSize;

  const new({
    required this.isLoading,
    this.loadingColor,
    this.imageAsset,
    this.label,
    this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: SpacingSize.md,
      children: [
        _IconChild(
          isLoading: isLoading,
          loadingColor: loadingColor,
          imageAsset: imageAsset,
          icon: icon,
          iconSize: iconSize,
        ),

        if (label != null) Text(label!),
      ],
    );
  }
}

class _IconChild extends StatelessWidget {
  final bool isLoading;
  final Color? loadingColor;
  final String? imageAsset;
  final IconData? icon;
  final double? iconSize;

  const new({
    required this.isLoading,
    this.loadingColor,
    this.imageAsset,
    this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) return AppLoading(color: loadingColor);
    return imageAsset != null
        ? Image.asset(imageAsset!, width: iconSize ?? IconSize.xs)
        : icon != null
        ? Icon(icon, size: iconSize)
        : const SizedBox.shrink();
  }
}
