import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension RoutesX on BuildContext {
  GoRouterState get routeState => GoRouterState.of(this);
}
