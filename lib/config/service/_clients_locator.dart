part of 'locator.dart';

void _clientInjection() async {
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);
  sl.registerLazySingleton<AuthClient>(
    () => SupabaseAuthClient(supabase: sl<SupabaseClient>()),
  );
  sl.registerLazySingleton<SocialAuthClient>(
    () => GoogleClient(google: sl<GoogleSignIn>()),
  );
  sl.registerLazySingleton<DatabaseClient>(
    () => SupabaseDatabaseClient(supabase: sl<SupabaseClient>()),
  );
  sl.registerLazySingleton<StorageClient>(
    () => SupabaseFileStorageClient(supabase: sl<SupabaseClient>()),
  );
}
