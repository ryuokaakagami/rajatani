part of '../button.dart';

class _FilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Size? minimumSize;
  final Color? background, foreground;
  final Widget child;

  const new({
    this.onPressed,
    this.minimumSize,
    this.background,
    this.foreground,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: minimumSize,
        backgroundColor: background,
        disabledBackgroundColor: background?.withValues(alpha: .38),
        foregroundColor: foreground,
        disabledForegroundColor: foreground?.withValues(alpha: .38),
      ),
      child: child,
    );
  }
}
