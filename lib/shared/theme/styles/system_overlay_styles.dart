part of '../app_theme.dart';

class SystemOverlayStyles {
  const new _();

  static SystemUiOverlayStyle fromBrightness({
    required Brightness brightness,
    required Scheme scheme,
  }) {
    final isDark = brightness == .dark;
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? .light : .dark,
      statusBarBrightness: isDark ? .dark : .light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: isDark ? .light : .dark,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    );
  }
}
