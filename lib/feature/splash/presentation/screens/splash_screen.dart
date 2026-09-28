import 'package:flutter/material.dart';

import '../../../../shared/widget/footer_watermark.dart';
import '../widgets/splash_logo.dart';

class SplashScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: .expand,
          children: [const SplashLogo(), const FooterWatermark()],
        ),
      ),
    );
  }
}
