import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/core.dart';
import '../../feature/feature.dart';
import '../../shared/shared.dart';

part '_clients_locator.dart';
part '_error_mapper_locator.dart';
part '_auth_locator.dart';
part '_user_locator.dart';
part '_profile_locator.dart';

final sl = GetIt.instance;

void initLocator() {
  _mediaInjection();
  _errorInjection();
  _clientInjection();
  _authInjection();
  _userInjection();
  _profileInjection();
}

void _mediaInjection() {
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton<MediaService>(
    () => MediaServiceImpl(picker: sl<ImagePicker>()),
  );
}
