part of 'router.dart';

final _authRoute = GoRoute(
  path: RoutesConstant.paths.signIn,
  name: RoutesConstant.names.signIn,
  pageBuilder: (context, state) {
    return transitionPage(
      key: state.pageKey,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<SignInModeCubit>()),
          BlocProvider(create: (_) => sl<SignInCubit>()),
        ],
        child: const SignInScreen(),
      ),
    );
  },
  routes: [
    GoRoute(
      path: RoutesConstant.paths.verification,
      name: RoutesConstant.names.signInVerification,
      pageBuilder: (context, state) {
        final (String contact, bool isPhoneMode) =
            state.extra as (String, bool);
        return transitionPage(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<ResendTimerCubit>()),
              BlocProvider(create: (_) => sl<SignInVerificationCubit>()),
            ],
            child: SignInVerificationScreen(
              contact: contact,
              isPhoneMode: isPhoneMode,
            ),
          ),
        );
      },
    ),
  ],
);
