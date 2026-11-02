part of '../app_theme.dart';

class CommonStyles {
  const new _();

  static DividerThemeData divider(Scheme scheme) {
    return DividerThemeData(color: scheme.divider, thickness: StrokeSize.thin);
  }

  static BottomSheetThemeData bottomSheet(Scheme scheme) {
    return BottomSheetThemeData(
      backgroundColor: scheme.surface,
      modalBackgroundColor: scheme.surface,
      dragHandleColor: scheme.onSurfaceVariant,
      showDragHandle: true,
    );
  }

  static DialogThemeData dialog({
    required Scheme scheme,
    required TextTheme textTheme,
  }) {
    return DialogThemeData(
      backgroundColor: scheme.surface,
      shape: RoundedRectangleBorder(borderRadius: .circular(RadiusSize.md)),
      contentTextStyle: textTheme.bodyMedium,
      titleTextStyle: textTheme.titleLarge?.copyWith(fontWeight: .bold),
    );
  }
}
