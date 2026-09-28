import 'package:flutter/material.dart';

import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/extension/extension.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../data/models/navigation_item.dart';
import 'navigation_capsul.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<NavigationItem> items;

  const new({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return Container(
      decoration: BoxDecoration(color: scheme.background),
      padding: .only(top: SpacingSize.lg, bottom: context.padding.bottom),
      child: Row(
        mainAxisAlignment: .spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];

          return NavigationCapsul(
            onSelected: onSelected,
            index: index,
            selectedIndex: selectedIndex,
            icon: item.icon,
            selectedIcon: item.selectedIcon,
            label: item.label,
          );
        }),
      ),
    );
  }
}
