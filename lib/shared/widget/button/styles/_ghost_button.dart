part of '../button.dart';

class _GhostButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? background, foreground;
  final Widget child;

  const new({
    this.onPressed,
    this.background,
    this.foreground,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        disabledBackgroundColor: background?.withValues(alpha: .38),
        disabledForegroundColor: foreground?.withValues(alpha: .38),
      ),
      child: child,
    );
  }
}
