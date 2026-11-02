import 'package:flutter/material.dart';

import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/widget/footer_watermark.dart';

class AuthLayout extends StatelessWidget {
  final List<Widget> children;

  const new({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const .all(SpacingSize.xl),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: .min,
                        spacing: SpacingSize.lg,
                        children: children,
                      ),
                    ),
                  ),

                  const SafeArea(child: FooterWatermark()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
