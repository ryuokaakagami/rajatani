part of 'locator.dart';

enum ErrorLocatorInstance {
  supabaseAuthError,
  supabaseDatabaseError,
  supabaseStorageError,
  googleAuthError,
  authErrorMapper,
  databaseErrorMapper,
  storageErrorMapper,
  backendErrorMapper,
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

  sl.registerLazySingleton<AppExceptionMapper>(
    () => SupabaseStorageExceptionMapper(),
    instanceName: ErrorLocatorInstance.supabaseStorageError.name,
  );
  sl.registerLazySingleton<AppExceptionMapper>(
    () => CompositeExceptionMapper(
      mappers: [
        sl<AppExceptionMapper>(
          instanceName: ErrorLocatorInstance.supabaseStorageError.name,
        ),
      ],
    ),
    instanceName: ErrorLocatorInstance.storageErrorMapper.name,
  );

  sl.registerLazySingleton<AppExceptionMapper>(
    () => CompositeExceptionMapper(
      mappers: [
        sl<AppExceptionMapper>(
          instanceName: ErrorLocatorInstance.databaseErrorMapper.name,
        ),
        sl<AppExceptionMapper>(
          instanceName: ErrorLocatorInstance.storageErrorMapper.name,
        ),
      ],
    ),
    instanceName: ErrorLocatorInstance.backendErrorMapper.name,
  );
}
