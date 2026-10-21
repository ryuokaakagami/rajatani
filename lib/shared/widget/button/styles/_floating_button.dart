part of '../button.dart';

class _FloatingButton extends StatelessWidget {
  final FloatingType type;
  final VoidCallback? onPressed;
  final bool isLoading, isDisabled;
  final Color? background, foreground;
  final Widget child;
  final Object? heroTag;
  final ShapeBorder? shape;
  final double? elevation;

  const new({
    required this.type,
    this.onPressed,
    required this.isLoading,
    required this.isDisabled,
    this.background,
    this.foreground,
    this.heroTag,
    this.shape,
    required this.child,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      .small => FloatingActionButton.small(
        onPressed: onPressed,
        backgroundColor: background,
        foregroundColor: foreground,
        heroTag: heroTag,
        shape: shape,
        elevation: elevation,
        child: child,
      ),

      .large => FloatingActionButton.large(
        onPressed: onPressed,
        backgroundColor: background,
        foregroundColor: foreground,
        heroTag: heroTag,
        shape: shape,
        elevation: elevation,
        child: child,
      ),

      .extended => FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: background,
        foregroundColor: foreground,
        heroTag: heroTag,
        shape: shape,
        elevation: elevation,
        label: child,
      ),

      _ => FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: background,
        foregroundColor: foreground,
        heroTag: heroTag,
        shape: shape,
        elevation: elevation,
        child: child,
      ),
    };
  }
}
