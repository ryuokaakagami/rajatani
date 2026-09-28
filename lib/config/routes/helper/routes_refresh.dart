import 'dart:async';

import 'package:flutter/material.dart';

class RoutesRefresh extends ChangeNotifier {
  late final StreamSubscription _session;
  late final Timer _splashTimer;

  bool _isWait = false;

  bool get isWait => _isWait;

  new({
    required Stream session,
    Duration duration = const Duration(seconds: 3),
  }) {
    _session = session.listen((_) => notifyListeners());
    _splashTimer = Timer(duration, () {
      _isWait = true;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _session.cancel();
    _splashTimer.cancel();
    super.dispose();
  }
}
