part of 'locator.dart';

void _userInjection() {
  _setupUserCore();
}

void _setupUserCore() {
  sl.registerLazySingleton<UserRemote>(
    () => UserRemoteImpl(client: sl<DatabaseClient>()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remote: sl<UserRemote>(),
      exceptionMapper: sl<AppExceptionMapper>(
        instanceName: ErrorLocatorInstance.supabaseDatabaseError.name,
      ),
    ),
  );
  sl.registerLazySingleton(
    () => FetchDataUser(repository: sl<UserRepository>()),
  );
  sl.registerFactory(
    () => UserCubit(
      fetchDataUser: sl<FetchDataUser>(),
      observeSession: sl<ObserveSession>(),
    ),
  );
}
