part of 'locator.dart';

void _profileInjection() {
  _setupProfileFeature();
}

void _setupProfileFeature() {
  sl.registerLazySingleton<ProfileRemote>(
    () => ProfileRemoteImpl(client: sl<DatabaseClient>()),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remote: sl<ProfileRemote>(),
      exceptionMapper: sl<AppExceptionMapper>(
        instanceName: ErrorLocatorInstance.supabaseDatabaseError.name,
      ),
    ),
  );

  sl.registerLazySingleton(
    () => UpdateDataProfile(repository: sl<ProfileRepository>()),
  );

  sl.registerLazySingleton(
    () => CheckUsernameAvailable(repository: sl<ProfileRepository>()),
  );

  sl.registerFactory(
    () => ProfileEditCubit(updateDataProfile: sl<UpdateDataProfile>()),
  );

  sl.registerFactory(
    () => CheckUsernameCubit(
      checkUsernameAvailable: sl<CheckUsernameAvailable>(),
    ),
  );
}
