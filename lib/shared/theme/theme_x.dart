part of 'app_theme.dart';

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Scheme get scheme => theme.extension<SchemeX>()!.scheme;
  Brightness get brightness => theme.brightness;
}
