class EnvConfig {
  const new _();

  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  static const String webGoogleClient = String.fromEnvironment(
    'WEB_GOOGLE_CLIENT',
  );
}
