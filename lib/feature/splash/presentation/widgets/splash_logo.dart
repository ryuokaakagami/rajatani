import 'package:flutter/material.dart';

import '../../../../shared/constant/icon_asset.dart';
import '../../../../shared/constant/icon_size.dart';

class SplashLogo extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(IconAsset.logo, width: IconSize.xl));
  }
}
