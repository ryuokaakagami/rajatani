import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../feature/feature.dart';
import '../constants/routes_constant.dart';

final router = GoRouter(
  initialLocation: RoutesConstant.paths.initial,
  routes: [
    GoRoute(
      path: RoutesConstant.paths.initial,
      name: RoutesConstant.names.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: RoutesConstant.paths.signIn,
      name: RoutesConstant.names.signIn,
      builder: (context, state) => const Scaffold(body: Center(child: Text('Sign-in'))),
    ),
  ],
);
