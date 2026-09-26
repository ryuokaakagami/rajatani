part of '../app_theme.dart';

class BarStyles {
  const new _();

  static AppBarThemeData appBar(Scheme scheme) {
    return AppBarThemeData(
      backgroundColor: scheme.background,
      foregroundColor: scheme.onBackground,
      surfaceTintColor: Colors.transparent,
      actionsPadding: const .symmetric(horizontal: SpacingSize.lg),
      elevation: .0,
    );
  }

  static NavigationBarThemeData navigationBar(Scheme scheme) {
    return NavigationBarThemeData(
      elevation: .0,
      backgroundColor: scheme.background,
      labelBehavior: .onlyShowSelected,
      indicatorColor: Colors.transparent,
      surfaceTintColor: scheme.primary,
      height: 50.0,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: scheme.primary, size: IconSize.sm);
        }

        return IconThemeData(color: scheme.onSurfaceVariant, size: IconSize.sm);
      }),
    );
  }
}
