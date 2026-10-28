import 'package:flutter/material.dart';

import '../dialog_x.dart';

class LoadingDialogController {
  final GlobalKey<NavigatorState> _key;

  int _count = 0;
  bool _open = false;

  new({required this._key});

  void show({String? title, String? message}) {
    _count++;
    if (_open) return;

    final context = _key.currentContext;
    if (context == null) {
      _count--;
      return;
    }

    _open = true;
    context
        .dialogLoading(title: title, message: message)
        .whenComplete(() => _open = false);
  }

  void hide() {
    if (_count > 0) _count--;
    if (_count > 0 || !_open) return;

    _key.currentState?.pop();
  }
}
