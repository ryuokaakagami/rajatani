import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widget/snackbar/snackbar.dart';
import '../../data/sources/dashboard_navigation.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/hide_on_scroll.dart';

class DashboardScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const new({super.key, required this.navigationShell});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime? _lastBack;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (widget.navigationShell.currentIndex != 0) {
          widget.navigationShell.goBranch(0);
          return;
        }

        final now = DateTime.now();
        final isFirstBack =
            _lastBack == null ||
            now.difference(_lastBack!) > const Duration(seconds: 2);

        if (isFirstBack) {
          _lastBack = now;
          context.snackBarInfo('Press back again to exit');
          return;
        }

        SystemNavigator.pop();
      },

      child: HideOnScroll(
        body: widget.navigationShell,
        child: CustomNavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          onSelected: (index) {
            widget.navigationShell.goBranch(
              index,
              initialLocation: index == widget.navigationShell.currentIndex,
            );
          },
          items: DashboardNavigation.items(),
        ),
      ),
    );
  }
}
