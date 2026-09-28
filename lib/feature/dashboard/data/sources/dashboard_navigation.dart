import 'package:flutter/material.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../presentation/widgets/avatar_navigation_item.dart';
import '../models/navigation_item.dart';

class DashboardNavigation {
  const new _();

  static const List<NavigationItem> _staticItems = [
    NavigationItem(
      icon: Icon(Iconsax.home_2_outline),
      label: 'Home',
      selectedIcon: Icon(Iconsax.home_2_bold),
    ),
    NavigationItem(
      icon: Icon(Iconsax.receipt_2_1_outline),
      label: 'Orders',
      selectedIcon: Icon(Iconsax.receipt_2_1_bold),
    ),
  ];

  static List<NavigationItem> items({String? avatarUrl, String? username}) {
    final rawName = username ?? 'Profile';

    final displayName = rawName.length > 11
        ? '${rawName.substring(0, 11)}...'
        : rawName;

    return [
      ..._staticItems,
      NavigationItem(
        icon: AvatarNavigationItem(avatarUrl: avatarUrl, isSelected: false),
        selectedIcon: AvatarNavigationItem(
          avatarUrl: avatarUrl,
          isSelected: true,
        ),
        label: displayName,
      ),
    ];
  }
}
