import 'package:flutter/material.dart';

extension MediaQueryX on BuildContext {
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;
}
