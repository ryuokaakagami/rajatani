part of 'locator.dart';

enum AuthLocatorInstance { supabaseAuth, googleAuth, authErrorMapper }

void _authLocator() {
  _setupAuthErrorMappers();
  _setupSessionCore();
  _setupAuthFeature();
}

/// Menyiapkan semua mapping error secara global
void _setupAuthErrorMappers() {
  sl.registerLazySingleton<AppExceptionMapper>(
    () => SupabaseAuthMapperException(),
    instanceName: AuthLocatorInstance.supabaseAuth.name,
  );

  sl.registerLazySingleton<AppExceptionMapper>(
    () => GoogleAuthMapperException(),
    instanceName: AuthLocatorInstance.googleAuth.name,
  );

  sl.registerLazySingleton<AppExceptionMapper>(
    () => CompositeExceptionMapper(
      mappers: [
        sl<AppExceptionMapper>(
          instanceName: AuthLocatorInstance.supabaseAuth.name,
        ),
        sl<AppExceptionMapper>(
          instanceName: AuthLocatorInstance.googleAuth.name,
        ),
      ],
    ),
    instanceName: AuthLocatorInstance.authErrorMapper.name,
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
      exceptionMapper: sl<AppExceptionMapper>(
        instanceName: AuthLocatorInstance.authErrorMapper.name,
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
        instanceName: AuthLocatorInstance.authErrorMapper.name,
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
