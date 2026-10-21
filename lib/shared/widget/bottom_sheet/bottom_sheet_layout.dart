import 'package:flutter/material.dart';

import '../../constant/spacing_size.dart';

class BottomSheetLayout extends StatelessWidget {
  final List<Widget> children;

  const new({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(bottom: SpacingSize.xxl),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: children,
      ),
    );
  }
}
