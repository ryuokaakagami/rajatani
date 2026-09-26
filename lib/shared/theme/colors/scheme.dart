import 'package:flutter/material.dart';

part '_scheme_generate.dart';
part '_scheme_lerp.dart';
part '_dark_sceme.dart';
part '_light_scheme.dart';
part 'scheme_x.dart';

class Scheme {
  final Color background;
  final Color surface;
  final Color primary;
  final Color info;
  final Color success;
  final Color warning;
  final Color error;
  final Color divider;
  final Color stroke;
  final Color hint;
  final Color skeletonBase;
  final Color skeletonHighlight;
  final Color onBackground;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color onPrimary;
  final Color onInfo;
  final Color onSuccess;
  final Color onWarning;
  final Color onError;

  new({
    required this.background,
    required this.surface,
    required this.primary,
    required this.info,
    required this.success,
    required this.warning,
    required this.error,
    required this.divider,
    required this.stroke,
    required this.hint,
    required this.skeletonBase,
    required this.skeletonHighlight,
    required this.onBackground,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.onPrimary,
    required this.onInfo,
    required this.onSuccess,
    required this.onWarning,
    required this.onError,
  });

  factory Scheme.generate({
    required Color background,
    required Color surface,
    required Color info,
    required Color success,
    required Color warning,
    required Color error,
    required Color skeletonHighlight,
    required Color onBackground,
    required Color onSurface,
  }) => _generate(
    background: background,
    surface: surface,
    info: info,
    success: success,
    warning: warning,
    error: error,
    skeletonHighlight: skeletonHighlight,
    onBackground: onBackground,
    onSurface: onSurface,
  );

  static Scheme lerp(Scheme a, Scheme b, double t) => _lerp(a, b, t);

  factory Scheme.dark() => _dark;
  factory Scheme.light() => _light;
}
