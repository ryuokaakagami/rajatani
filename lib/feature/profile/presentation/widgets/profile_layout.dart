import 'package:flutter/material.dart';

import '../../../../shared/constant/spacing_size.dart';

class ProfileLayout extends StatelessWidget {
  final String? titleAppBar;
  final List<Widget> children;

  const new({super.key, this.titleAppBar, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleAppBar ?? 'Profile')),
      body: SingleChildScrollView(
        padding: .only(
          top: SpacingSize.xl,
          left: SpacingSize.xl,
          right: SpacingSize.xl,
          bottom: SpacingSize.xxxl,
        ),
        child: Column(spacing: SpacingSize.lg, children: children),
      ),
    );
  }
}
