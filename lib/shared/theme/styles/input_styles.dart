part of '../app_theme.dart';

class InputStyles {
  const new _();

  static InputDecorationThemeData decoration({
    required Scheme scheme,
    required TextTheme textTheme,
  }) {
    final bodyLarge = textTheme.bodyLarge?.copyWith(color: scheme.hint);
    final bodyMedium = textTheme.bodyMedium?.copyWith(color: scheme.onError);

    return InputDecorationThemeData(
      filled: true,
      fillColor: scheme.surface,
      errorMaxLines: 3,
      suffixIconColor: scheme.onSurface,
      prefixIconColor: scheme.onSurface,
      focusColor: scheme.primary,
      hintStyle: bodyLarge,
      errorStyle: bodyMedium,
      border: _inputBorder(scheme.stroke, width: StrokeSize.thin),
      enabledBorder: _inputBorder(scheme.stroke),
      errorBorder: _inputBorder(scheme.error),
      focusedErrorBorder: _inputBorder(scheme.error),
      contentPadding: .all(SpacingSize.lg),
    );
  }

  static OutlineInputBorder _inputBorder(Color color, {double? width}) {
    return OutlineInputBorder(
      borderRadius: .circular(RadiusSize.sm),
      borderSide: BorderSide(color: color, width: width ?? StrokeSize.regular),
    );
  }
}
