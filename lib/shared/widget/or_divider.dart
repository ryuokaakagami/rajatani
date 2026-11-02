import 'package:flutter/material.dart';

import '../shared.dart';

class OrDivider extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.scheme.onSurfaceVariant;
    final style = context.textTheme.bodyMedium;
    return FractionallySizedBox(
      widthFactor: .5,
      child: Row(
        spacing: SpacingSize.md,
        children: [
          Expanded(child: Divider(color: color)),
          Text(
            'OR',
            style: style?.copyWith(color: color, fontWeight: .w600),
          ),
          Expanded(child: Divider(color: color)),
        ],
      ),
    );
  }
}
