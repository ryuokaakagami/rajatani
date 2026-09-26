part of 'scheme.dart';

Scheme _lerp(Scheme a, Scheme b, double t) {
  return Scheme(
    background: Color.lerp(a.background, b.background, t)!,
    surface: Color.lerp(a.surface, b.surface, t)!,
    primary: Color.lerp(a.primary, b.primary, t)!,
    info: Color.lerp(a.info, b.info, t)!,
    success: Color.lerp(a.success, b.success, t)!,
    warning: Color.lerp(a.warning, b.warning, t)!,
    error: Color.lerp(a.error, b.error, t)!,
    divider: Color.lerp(a.divider, b.divider, t)!,
    stroke: Color.lerp(a.stroke, b.stroke, t)!,
    hint: Color.lerp(a.hint, b.hint, t)!,
    skeletonBase: Color.lerp(a.skeletonBase, b.skeletonBase, t)!,
    skeletonHighlight: Color.lerp(a.skeletonHighlight, b.skeletonHighlight, t)!,
    onBackground: Color.lerp(a.onBackground, b.onBackground, t)!,
    onSurface: Color.lerp(a.onSurface, b.onSurface, t)!,
    onSurfaceVariant: Color.lerp(a.onSurfaceVariant, b.onSurfaceVariant, t)!,
    onPrimary: Color.lerp(a.onPrimary, b.onPrimary, t)!,
    onInfo: Color.lerp(a.onInfo, b.onInfo, t)!,
    onSuccess: Color.lerp(a.onSuccess, b.onSuccess, t)!,
    onWarning: Color.lerp(a.onWarning, b.onWarning, t)!,
    onError: Color.lerp(a.onError, b.onError, t)!,
  );
}
