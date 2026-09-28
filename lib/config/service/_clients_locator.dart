part of 'locator.dart';

void _clientLocator() async {
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);
  sl.registerLazySingleton<AuthClient>(
    () => SupabaseAuthClient(supabase: sl<SupabaseClient>()),
  );
  sl.registerLazySingleton<SocialAuthClient>(
    () => GoogleClient(google: sl<GoogleSignIn>()),
  );
}
