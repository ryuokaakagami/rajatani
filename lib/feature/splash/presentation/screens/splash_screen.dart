import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/routes.dart';
import '../../../../shared/widget/footer_watermark.dart';
import '../widgets/splash_logo.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectToSignIn();
  }

  Future<void> redirectToSignIn() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) context.goNamed(RoutesConstant.names.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(fit: .expand, children: [const SplashLogo(), const FooterWatermark()]),
      ),
    );
  }
}
