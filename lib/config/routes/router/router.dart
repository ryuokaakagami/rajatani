import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../feature/feature.dart';
import '../../service/locator.dart';
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
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<SignInModeCubit>()),
            BlocProvider(create: (_) => sl<SignInCubit>()),
          ],
          child: const SignInScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutesConstant.paths.verification,
          name: RoutesConstant.names.signInVerification,
          builder: (context, state) {
            final (String contact, bool isPhoneMode) = state.extra as (String, bool);
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => sl<ResendTimerCubit>()),
                BlocProvider(create: (_) => sl<SignInVerificationCubit>()),
              ],
              child: SignInVerificationScreen(contact: contact, isPhoneMode: isPhoneMode),
            );
          },
        ),
      ],
    ),
  ],
);
