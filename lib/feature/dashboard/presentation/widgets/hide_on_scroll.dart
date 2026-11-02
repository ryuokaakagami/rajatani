import 'package:flutter/material.dart';

class HideOnScroll extends StatefulWidget {
  final Widget child, body;
  final ValueChanged<bool>? onVisibilityChanged;

  const new({
    super.key,
    required this.body,
    required this.child,
    required this.onVisibilityChanged,
  });

  @override
  State<HideOnScroll> createState() => _HideOnScrollState();
}

class _HideOnScrollState extends State<HideOnScroll> {
  bool _isVisible = true;

  void _setVisible(bool value) {
    if (_isVisible == value) return;
    setState(() => _isVisible = value);
    widget.onVisibilityChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.direction == .forward) {
          if (!_isVisible) _setVisible(true);
        } else if (notification.direction == .reverse) {
          if (_isVisible) _setVisible(false);
        }
        return false;
      },
      child: Stack(
        fit: .expand,
        children: [
          widget.body,

          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutQuint,
            bottom: _isVisible ? .0 : -120.0,
            left: .0,
            right: .0,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
