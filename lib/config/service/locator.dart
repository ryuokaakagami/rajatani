import 'package:get_it/get_it.dart';

import '../../feature/feature.dart';

final sl = GetIt.instance;

void initLocator() {
  sl.registerFactory(() => SignInModeCubit());
  sl.registerFactory(() => SignInCubit());
  sl.registerFactory(() => ResendTimerCubit());
  sl.registerFactory(() => SignInVerificationCubit());
}
