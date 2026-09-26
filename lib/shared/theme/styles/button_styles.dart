part of '../app_theme.dart';

class ButtonStyles {
  const new _();

  static FilledButtonThemeData filledButton({
    required Scheme scheme,
    required TextTheme textTheme,
  }) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        disabledBackgroundColor: scheme.primary.withValues(alpha: .38),
        disabledForegroundColor: scheme.onPrimary.withValues(alpha: .38),
        textStyle: _textStyle(textTheme),
        iconSize: IconSize.xs,
        minimumSize: const Size(0, ButtonSize.lg),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: _buttonShape,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButton({
    required Scheme scheme,
    required TextTheme textTheme,
  }) {
    return OutlinedButtonThemeData(
      style:
          OutlinedButton.styleFrom(
            foregroundColor: scheme.onSurfaceVariant,
            disabledForegroundColor: scheme.onSurfaceVariant.withValues(
              alpha: .38,
            ),
            textStyle: _textStyle(textTheme),
            iconSize: IconSize.xs,
            minimumSize: const Size(0, ButtonSize.lg),
            surfaceTintColor: Colors.transparent,
            elevation: .0,
            shape: _buttonShape,
          ).copyWith(
            side: WidgetStatePropertyAll(
              BorderSide(color: scheme.stroke, width: StrokeSize.thin),
            ),
          ),
    );
  }

  static TextButtonThemeData textButton({
    required Scheme scheme,
    required TextTheme textTheme,
  }) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: .0,
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.primary,
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: scheme.primary.withValues(alpha: .38),
        textStyle: _textStyle(textTheme),
        padding: .zero,
        minimumSize: .zero,
        tapTargetSize: .shrinkWrap,
        visualDensity: .compact,
      ),
    );
  }

  static FloatingActionButtonThemeData floatingButton({
    required Scheme scheme,
    required TextTheme textTheme,
  }) {
    return FloatingActionButtonThemeData(
      disabledElevation: .0,
      elevation: .0,
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      shape: _buttonShape,
      smallSizeConstraints: BoxConstraints.tightFor(
        width: ButtonSize.sm,
        height: ButtonSize.sm,
      ),
      sizeConstraints: BoxConstraints.tightFor(
        width: ButtonSize.md,
        height: ButtonSize.md,
      ),
      largeSizeConstraints: BoxConstraints.tightFor(
        width: ButtonSize.lg,
        height: ButtonSize.lg,
      ),
      extendedSizeConstraints: BoxConstraints(
        minHeight: ButtonSize.xl,
        maxHeight: ButtonSize.xl,
        minWidth: ButtonSize.xl,
        maxWidth: 100.0,
      ),
    );
  }

  static TextStyle? _textStyle(TextTheme textTheme) {
    return textTheme.labelLarge?.copyWith(fontWeight: .w700);
  }

  static OutlinedBorder get _buttonShape {
    return RoundedRectangleBorder(borderRadius: .circular(RadiusSize.sm));
  }
}
