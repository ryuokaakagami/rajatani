part of '../app_theme.dart';

class TypographyStyles {
  const new _();

  static TextTheme _typography(Brightness brightness) {
    return brightness == .dark
        ? Typography.material2021().white
        : Typography.material2021().black;
  }

  static TextStyle _style(Scheme scheme) {
    return TextStyle(
      fontFamily: 'JakartaSans',
      color: scheme.onBackground,
      leadingDistribution: .even,
    );
  }

  static TextTheme text({
    required Brightness brightness,
    required Scheme scheme,
  }) {
    final typography = _typography(brightness);
    final style = _style(scheme);

    return TextTheme(
      displayLarge: typography.displayLarge?.merge(style),
      displayMedium: typography.displayMedium?.merge(style),
      displaySmall: typography.displaySmall?.merge(style),
      headlineLarge: typography.headlineLarge?.merge(style),
      headlineMedium: typography.headlineMedium?.merge(style),
      headlineSmall: typography.headlineSmall?.merge(style),
      titleLarge: typography.titleLarge?.merge(style),
      titleMedium: typography.titleMedium?.merge(style),
      titleSmall: typography.titleSmall?.merge(style),
      bodyLarge: typography.bodyLarge?.merge(style),
      bodyMedium: typography.bodyMedium?.merge(style),
      bodySmall: typography.bodySmall?.merge(style),
      labelLarge: typography.labelLarge?.merge(style),
      labelMedium: typography.labelMedium?.merge(style),
      labelSmall: typography.labelSmall?.merge(style),
    );
  }
}
