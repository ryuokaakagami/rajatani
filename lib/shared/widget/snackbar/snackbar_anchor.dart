import 'package:flutter/material.dart';

import '../../../config/routes/routes.dart';
import 'snackbar_inset.dart';

class SnackbarAnchor extends StatefulWidget {
  final Widget child;
  const new({super.key, required this.child});

  @override
  State<SnackbarAnchor> createState() => _SnackbarAnchorState();
}

class _SnackbarAnchorState extends State<SnackbarAnchor> {
  final _key = GlobalKey();
  bool _active = true;

  Widget get child => widget.child;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _active = context.isCurrentOf && TickerMode.valuesOf(context).enabled;
    _schedule();
  }

  void _schedule() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _sync());
  }

  void _sync() {
    if (!mounted) return;
    if (!_active) return SnackbarInset.release(this);

    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    SnackbarInset.claim(this, box.size.height);
  }

  @override
  dispose() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => SnackbarInset.release(this),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _schedule();
    return KeyedSubtree(key: _key, child: child);
  }
}
