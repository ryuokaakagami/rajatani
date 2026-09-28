import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../../feature/feature.dart';
import '../../../shared/shared.dart';
import '../../service/locator.dart';
import '../constants/routes_constant.dart';
import '../helper/routes_guard.dart';
import '../helper/routes_refresh.dart';

part '_auth_route.dart';
part '_home_route.dart';

final _session = sl<SessionCubit>();
final _refresh = RoutesRefresh(session: _session.stream);
final _guard = RoutesGuard(cubit: _session, refresh: _refresh);

final router = GoRouter(
  initialLocation: RoutesConstant.paths.initial,
  refreshListenable: _refresh,
  redirect: _guard.redirect,
  routes: [
    GoRoute(
      path: RoutesConstant.paths.initial,
      name: RoutesConstant.names.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    _authRoute,

    _homeRoute,
  ],
);
