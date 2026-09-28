part of 'locator.dart';

void _authLocator() {
  _setupErrorHandlers();
  _setupSessionCore();
  _setupAuthFeature();
}

/// Menyiapkan semua mapping error secara global
void _setupErrorHandlers() {
  sl.registerLazySingleton<AuthExceptionMapper>(
    () => SupabaseAuthMapperException(),
    instanceName: 'supabase_auth',
  );

  sl.registerLazySingleton<AuthExceptionMapper>(
    () => GoogleAuthMapperException(),
    instanceName: 'google_auth',
  );

  sl.registerLazySingleton(
    () => AuthExceptionHandler(
      mappers: [
        sl<AuthExceptionMapper>(instanceName: 'supabase_auth'),
        sl<AuthExceptionMapper>(instanceName: 'google_auth'),
      ],
    ),
  );
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
      exceptionHandler: sl<AuthExceptionHandler>(),
    ),
  );

  // --- Domain Layer (Use Cases) ---
  sl.registerLazySingleton(
    () => ObserveSession(repository: sl<SessionRepository>()),
  );

  sl.registerLazySingleton(() => SignOut(repository: sl<SessionRepository>()));

  // --- Presentation Layer (Global Cubit) ---
  sl.registerFactory(
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
      exceptionHandler: sl<AuthExceptionHandler>(),
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
