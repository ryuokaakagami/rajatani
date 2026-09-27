part of 'snackbar.dart';

class AppSnackbar {
  const AppSnackbar._();

  static SnackBar build({
    required String message,
    required Color backgroundColor,
    required Color foregroundColor,
    required Color borderColor,
    required TextTheme textTheme,
  }) {
    return SnackBar(
      backgroundColor: backgroundColor,
      behavior: .floating,
      margin: const .all(SpacingSize.xl),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(RadiusSize.sm),
        side: BorderSide(color: borderColor, width: StrokeSize.thin),
      ),
      padding: const .all(SpacingSize.lg),
      content: Text(
        message,
        style: textTheme.bodyMedium?.copyWith(color: foregroundColor),
      ),
    );
  }
}
