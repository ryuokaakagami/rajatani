part of 'locator.dart';

void _authInjection() {
  _setupSessionCore();
  _setupAuthFeature();
}

void _setupSessionCore() {
  // --- Data Layer ---
  sl.registerLazySingleton<SessionRemote>(
    () => SessionRemoteImpl(
      authClient: sl<AuthClient>(),
      socialAuthClient: sl<SocialAuthClient>(),
    ),
  );

  sl.registerLazySingleton<SessionRepository>(
    () => SessionRepositoryImpl(
      remote: sl<SessionRemote>(),
      exceptionMapper: sl<AppExceptionMapper>(
        instanceName: ErrorLocatorInstance.authErrorMapper.name,
      ),
    ),
  );

  // --- Domain Layer (Use Cases) ---
  sl.registerLazySingleton(
    () => ObserveSession(repository: sl<SessionRepository>()),
  );

  sl.registerLazySingleton(() => SignOut(repository: sl<SessionRepository>()));

  // --- Presentation Layer (Global Cubit) ---
  sl.registerLazySingleton(
    () => SessionCubit(
      observeSession: sl<ObserveSession>(),
      signOut: sl<SignOut>(),
    ),
  );
}

void _setupAuthFeature() {
  // --- Data Layer ---
  sl.registerLazySingleton<AuthRemote>(
    () => AuthRemoteImpl(
      authClient: sl<AuthClient>(),
      socialAuthClient: sl<SocialAuthClient>(),
    ),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remote: sl<AuthRemote>(),
      exceptionMapper: sl<AppExceptionMapper>(
        instanceName: ErrorLocatorInstance.authErrorMapper.name,
      ),
    ),
  );

  // --- Domain Layer (Use Cases) ---
  sl.registerLazySingleton(
    () => SignInWithOtp(repository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton(
    () => SignInWithGoogle(repository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton(
    () => SignInVerification(repository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton(
    () => SignInResendCode(repository: sl<AuthRepository>()),
  );

  // --- Presentation Layer (Feature Cubits) ---
  sl.registerFactory(() => SignInModeCubit());

  sl.registerFactory(() => ResendTimerCubit());

  sl.registerFactory(
    () => SignInCubit(
      inWithOtp: sl<SignInWithOtp>(),
      inWithGoogle: sl<SignInWithGoogle>(),
    ),
  );

  sl.registerFactory(
    () => SignInVerificationCubit(
      inVerification: sl<SignInVerification>(),
      inResendCode: sl<SignInResendCode>(),
    ),
  );
}
