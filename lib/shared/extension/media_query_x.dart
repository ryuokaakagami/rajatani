import 'package:flutter/material.dart';

extension MediaQueryX on BuildContext {
  EdgeInsets get padding => MediaQuery.paddingOf(this);
}
