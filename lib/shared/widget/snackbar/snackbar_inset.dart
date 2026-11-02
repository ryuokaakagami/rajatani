import 'package:flutter/material.dart';

class SnackbarInset {
  static final ValueNotifier<double> bottom = ValueNotifier(0);
  static Object? _owner;
  static double _height = 0;
  static bool _hidden = false;

  const new _();

  static void _publish() {
    final value = _hidden ? 0.0 : _height;
    if (bottom.value != value) bottom.value = value;
  }

  static void claim(Object owner, double height) {
    _owner = owner;
    _height = height;
    _publish();
  }

  static void release(Object owner) {
    if (_owner != owner) return;

    _owner = null;
    _height = 0;
    _hidden = false;
    _publish();
  }

  static void setHidden(bool value) {
    if (_hidden == value) return;
    _hidden = value;
    _publish();
  }
}
