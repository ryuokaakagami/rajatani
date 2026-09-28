import 'package:flutter/material.dart';

import '../../../../shared/constant/constant.dart';
import '../../../../shared/theme/app_theme.dart';

class NavigationCapsul extends StatelessWidget {
  final ValueChanged<int> onSelected;
  final int index, selectedIndex;
  final Widget icon, selectedIcon;
  final String label;
  final Color? color, selectedColor;

  const new({
    super.key,
    required this.onSelected,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.color,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textStyle = context.textTheme.bodyLarge;
    final isSelected = selectedIndex == index;

    final itemColor = color ?? scheme.onSurfaceVariant;
    final itemSelectedColor = selectedColor ?? scheme.primary;

    const duration = Duration(milliseconds: 350);

    return GestureDetector(
      onTap: () => onSelected.call(index),
      behavior: .opaque,
      child: AnimatedContainer(
        duration: duration,
        curve: Curves.easeInOut,
        padding: const .symmetric(
          horizontal: SpacingSize.lg,
          vertical: SpacingSize.md,
        ),
        decoration: BoxDecoration(
          color: isSelected ? scheme.surface : Colors.transparent,
          borderRadius: .circular(RadiusSize.lg),
        ),
        child: Row(
          mainAxisSize: .min,
          children: [
            IconTheme(
              data: IconThemeData(
                color: isSelected ? itemSelectedColor : itemColor,
              ),
              child: isSelected ? selectedIcon : icon,
            ),

            AnimatedSize(
              duration: duration,
              curve: Curves.easeOutQuint,
              child: SizedBox(
                width: isSelected ? null : 0.0,
                child: Padding(
                  padding: const .symmetric(horizontal: SpacingSize.md),
                  child: Text(
                    label,
                    style: textStyle?.copyWith(
                      fontWeight: .w600,
                      color: itemSelectedColor,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
