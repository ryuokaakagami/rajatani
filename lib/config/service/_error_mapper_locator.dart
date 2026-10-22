part of 'locator.dart';

enum ErrorLocatorInstance {
  supabaseAuthError,
  supabaseDatabaseError,
  googleAuthError,
  authErrorMapper,
  databaseErrorMapper,
}

void _errorInjection() {
  sl.registerLazySingleton<AppExceptionMapper>(
    () => SupabaseAuthMapperException(),
    instanceName: ErrorLocatorInstance.supabaseAuthError.name,
  );

  sl.registerLazySingleton<AppExceptionMapper>(
    () => GoogleAuthMapperException(),
    instanceName: ErrorLocatorInstance.googleAuthError.name,
  );

  sl.registerLazySingleton<AppExceptionMapper>(
    () => CompositeExceptionMapper(
      mappers: [
        sl<AppExceptionMapper>(
          instanceName: ErrorLocatorInstance.supabaseAuthError.name,
        ),
        sl<AppExceptionMapper>(
          instanceName: ErrorLocatorInstance.googleAuthError.name,
        ),
      ],
    ),
    instanceName: ErrorLocatorInstance.authErrorMapper.name,
  );

  sl.registerLazySingleton<AppExceptionMapper>(
    () => SupabaseDatabaseExceptionMapper(),
    instanceName: ErrorLocatorInstance.supabaseDatabaseError.name,
  );
  sl.registerLazySingleton<AppExceptionMapper>(
    () => CompositeExceptionMapper(
      mappers: [
        sl<AppExceptionMapper>(
          instanceName: ErrorLocatorInstance.supabaseDatabaseError.name,
        ),
      ],
    ),
    instanceName: ErrorLocatorInstance.databaseErrorMapper.name,
  );
}
