import 'package:flutter/material.dart';

class NavigationItem {
  final Widget icon, selectedIcon;
  final String label;

  const new({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}
