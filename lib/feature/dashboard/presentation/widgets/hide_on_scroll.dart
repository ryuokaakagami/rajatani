import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideOnScroll extends StatefulWidget {
  final Widget child, body;

  const new({super.key, required this.body, required this.child});

  @override
  State<HideOnScroll> createState() => _HideOnScrollState();
}

class _HideOnScrollState extends State<HideOnScroll> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.direction == ScrollDirection.forward) {
          if (!_isVisible) setState(() => _isVisible = true);
        } else if (notification.direction == ScrollDirection.reverse) {
          if (_isVisible) setState(() => _isVisible = false);
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
