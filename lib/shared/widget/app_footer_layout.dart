import 'package:flutter/material.dart';

import '../constant/spacing_size.dart';

class AppFooterLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final List<Widget> children;
  final EdgeInsets? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final double? spacing, footerSpacing;
  final Widget? footer;

  const new({
    super.key,
    this.appBar,
    this.padding,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.spacing,
    this.footerSpacing,
    this.footer,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: padding ?? const .all(SpacingSize.xl),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                spacing: footerSpacing ?? .0,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: mainAxisAlignment ?? .center,
                      crossAxisAlignment: crossAxisAlignment ?? .center,
                      spacing: spacing ?? SpacingSize.lg,
                      children: children,
                    ),
                  ),

                  if (footer != null) SafeArea(child: footer!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
