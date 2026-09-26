part of 'scheme.dart';

Scheme _generate({
  required Color background,
  required Color surface,
  required Color info,
  required Color success,
  required Color warning,
  required Color error,
  required Color skeletonHighlight,
  required Color onBackground,
  required Color onSurface,
}) {
  final primary = const Color(0xFFD99B26);
  final onSurfaceVariant = Color.lerp(onSurface, onBackground, .5)!;
  final divider = onSurfaceVariant.withValues(alpha: .16);
  final stroke = onSurfaceVariant.withValues(alpha: .32);
  final hint = onSurfaceVariant.withValues(alpha: .6);

  final onPrimary = const Color(0xFFF9F9FA);
  final onInfo = Color.lerp(surface, info, .85)!;
  final onSuccess = Color.lerp(surface, success, .85)!;
  final onWarning = Color.lerp(surface, warning, .85)!;
  final onError = Color.lerp(surface, error, .85)!;

  return Scheme(
    background: background,
    surface: surface,
    primary: primary,
    info: info,
    success: success,
    warning: warning,
    error: error,
    divider: divider,
    stroke: stroke,
    hint: hint,
    skeletonBase: surface,
    skeletonHighlight: skeletonHighlight,
    onBackground: onBackground,
    onSurface: onSurface,
    onSurfaceVariant: onSurfaceVariant,
    onPrimary: onPrimary,
    onInfo: onInfo,
    onSuccess: onSuccess,
    onWarning: onWarning,
    onError: onError,
  );
}
