import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/console.dart';
import '../../../shared/cubit/session/session_cubit.dart';
import '../constants/routes_constant.dart';
import 'routes_refresh.dart';

class RoutesGuard {
  final SessionCubit _cubit;
  final RoutesRefresh _refresh;

  new({required this._cubit, required this._refresh});

  final _publicRoutes = [
    RoutesConstant.paths.signIn,
    RoutesConstant.paths.initial,
  ];

  String? redirect(BuildContext context, GoRouterState state) {
    final sessionState = _cubit.state;
    final location = state.matchedLocation;
    final isWait = _refresh.isWait;
    final isPublicRoute = _publicRoutes.any((p) => _matchesRoute(location, p));
    final isSplash = location == RoutesConstant.paths.initial;

    final isStillLoadingOrWaiting =
        !isWait ||
        sessionState.maybeWhen(
          initial: () => true,
          loading: () => true,
          orElse: () => false,
        );

    if (isStillLoadingOrWaiting) {
      return isSplash ? null : RoutesConstant.paths.initial;
    }

    Console.info(
      message:
          'SessionState: $sessionState, location: $location, isWait: $isWait',
    );

    return sessionState.maybeWhen(
      authenticated: (_) => isPublicRoute
          ? context.namedLocation(RoutesConstant.names.home)
          : null,
      unAuthentacted: () => isSplash || !isPublicRoute
          ? context.namedLocation(RoutesConstant.names.signIn)
          : null,
      orElse: () => null,
    );
  }

  bool _matchesRoute(String location, String base) {
    return location == base || location.startsWith('$base/');
  }
}
