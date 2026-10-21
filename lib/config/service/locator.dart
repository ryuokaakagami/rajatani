import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/core.dart';
import '../../feature/feature.dart';
import '../../shared/shared.dart';

part '_clients_locator.dart';
part '_auth_locator.dart';

final sl = GetIt.instance;

void initLocator() {
  _mediaInjection();
  _clientLocator();
  _authLocator();
}

void _mediaInjection() {
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton<MediaService>(
    () => MediaServiceImpl(picker: sl<ImagePicker>()),
  );
}
