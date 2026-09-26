import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/main_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const MainConfig());
}
