import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../constant/radius_size.dart';
import '../../constant/spacing_size.dart';
import '../../constant/stroke_size.dart';
import '../../extension/media_query_x.dart';
import '../../theme/app_theme.dart';
import 'snackbar_inset.dart';

part '_snackbar_host.dart';

enum SnackbarType { info, success, warning, error }

class AppSnackbar {
  static OverlayEntry? _entry;

  const new _();

  static void show(
    BuildContext context, {
    required String message,
    required SnackbarType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    _remove();

    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _SnackbarHost(
        message: message,
        type: type,
        duration: duration,
        onDismissed: () {
          if (_entry == entry) _remove();
        },
      ),
    );

    _entry = entry;
    overlay.insert(entry);
  }

  static void _remove() {
    _entry?.remove();
    _entry?.dispose();
    _entry = null;
  }
}
