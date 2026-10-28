part of 'locator.dart';

void _profileInjection() {
  _setupProfileFeature();
}

void _setupProfileFeature() {
  sl.registerLazySingleton<ProfileRemote>(
    () => ProfileRemoteImpl(
      databaseClient: sl<DatabaseClient>(),
      storageClient: sl<StorageClient>(),
    ),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remote: sl<ProfileRemote>(),
      exceptionMapper: sl<AppExceptionMapper>(
        instanceName: ErrorLocatorInstance.backendErrorMapper.name,
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

  sl.registerLazySingleton(() => PrepareAvatar(media: sl<MediaService>()));

  sl.registerLazySingleton(
    () => UpdateAvatar(
      repository: sl<ProfileRepository>(),
      media: sl<MediaService>(),
    ),
  );

  sl.registerLazySingleton(
    () => DeleteAvatar(repository: sl<ProfileRepository>()),
  );

  sl.registerLazySingleton(() => DiscardAvatarJob(media: sl<MediaService>()));

  sl.registerFactory(
    () => AvatarCubit(
      prepareAvatar: sl<PrepareAvatar>(),
      updateAvatar: sl<UpdateAvatar>(),
      deleteAvatar: sl<DeleteAvatar>(),
      discardAvatarJob: sl<DiscardAvatarJob>(),
    ),
  );
}
