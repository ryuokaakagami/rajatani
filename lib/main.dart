import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'config/main_config.dart';
import 'config/service/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getApplicationSupportDirectory()).path),
  );

  HydratedBloc.storage = storage;

  initLocator();

  runApp(const MainConfig());
}
