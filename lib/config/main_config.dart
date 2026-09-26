import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/theme/theme.dart';
import 'main_home.dart';

class MainConfig extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raja Tani',
      theme: AppTheme(brightness: .light).theme,
      darkTheme: AppTheme(brightness: .dark).theme,
      themeMode: .system,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemOverlayStyles.fromBrightness(
          brightness: context.brightness,
          scheme: context.scheme,
        ),
        child: child!,
      ),
      home: const MainHome(),
    );
  }
}
