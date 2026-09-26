import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/button_size.dart';
import '../constant/icon_size.dart';
import '../constant/radius_size.dart';
import '../constant/spacing_size.dart';
import '../constant/stroke_size.dart';
import 'colors/scheme.dart';

part 'theme_x.dart';
part 'styles/bar_styles.dart';
part 'styles/button_styles.dart';
part 'styles/input_styles.dart';
part 'styles/system_overlay_styles.dart';
part 'styles/typography_styles.dart';
part 'styles/common_styles.dart';

class AppTheme {
  final Brightness _brightness;

  new({required this._brightness});

  ThemeData get theme {
    final scheme = _brightness == .dark ? Scheme.dark() : Scheme.light();

    final colorScheme = ColorScheme(
      brightness: _brightness,
      primary: scheme.primary,
      onPrimary: scheme.onPrimary,
      secondary: scheme.primary,
      onSecondary: scheme.onPrimary,
      error: scheme.error,
      onError: scheme.onError,
      surface: scheme.background,
      onSurface: scheme.onBackground,
    );

    final textTheme = TypographyStyles.text(
      brightness: _brightness,
      scheme: scheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: _brightness,
      scaffoldBackgroundColor: scheme.background,
      colorScheme: colorScheme,
      primaryColor: scheme.primary,
      dividerColor: scheme.divider,
      extensions: [SchemeX(scheme: scheme)],
      textTheme: textTheme,
      appBarTheme: BarStyles.appBar(scheme),
      navigationBarTheme: BarStyles.navigationBar(scheme),
      inputDecorationTheme: InputStyles.decoration(
        scheme: scheme,
        textTheme: textTheme,
      ),
      filledButtonTheme: ButtonStyles.filledButton(
        scheme: scheme,
        textTheme: textTheme,
      ),
      outlinedButtonTheme: ButtonStyles.outlinedButton(
        scheme: scheme,
        textTheme: textTheme,
      ),
      textButtonTheme: ButtonStyles.textButton(
        scheme: scheme,
        textTheme: textTheme,
      ),
      dividerTheme: CommonStyles.divider(scheme),
      bottomSheetTheme: CommonStyles.bottomSheet(scheme),
      dialogTheme: CommonStyles.dialog(scheme: scheme, textTheme: textTheme),
      snackBarTheme: SnackBarThemeData(backgroundColor: scheme.surface),
    );
  }
}
