import 'package:flutter/material.dart';

import '../../../../shared/constant/icon_asset.dart';
import '../../../../shared/constant/icon_size.dart';
import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/extension/mask_x.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../constants/auth_string.dart';

class AuthHeader extends StatelessWidget {
  final bool isSignIn, isPhoneMode;
  final String contact;

  const new signIn({super.key}) : isSignIn = true, isPhoneMode = false, contact = '';
  const new verification({super.key, this.isPhoneMode = false, required this.contact})
    : isSignIn = false;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;
    return Column(
      mainAxisSize: .min,
      spacing: SpacingSize.md,
      children: [
        Row(
          mainAxisSize: .min,
          spacing: SpacingSize.md,
          children: [
            Image.asset(isSignIn ? IconAsset.logo : IconAsset.send, width: IconSize.lg),
            Text(
              isSignIn ? AuthString.signIn.title : AuthString.verification.title,
              style: textTheme.headlineMedium?.copyWith(color: scheme.primary, fontWeight: .w600),
            ),
          ],
        ),

        Text(
          isSignIn
              ? AuthString.signIn.subtitle
              : AuthString.verification.subtitle(
                  isPhoneMode ? contact.toMaskPhone : contact.toMaskEmail,
                ),
          style: textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
          textAlign: .center,
        ),
      ],
    );
  }
}
