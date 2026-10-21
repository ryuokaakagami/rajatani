import 'package:flutter/material.dart';

import '../../../../shared/constant/app_string.dart';
import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../../../shared/widget/button/button.dart';

class ProfileEditLayout extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final VoidCallback? onPressed;
  final bool isLoading, isOtherLoading;
  final Widget field;
  final String title, textInfo;

  const new({
    super.key,
    this.formKey,
    this.onPressed,
    this.isLoading = false,
    this.isOtherLoading = false,
    required this.field,
    required this.title,
    required this.textInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const .all(SpacingSize.xl),
        child: Form(
          key: formKey,
          autovalidateMode: .onUserInteraction,
          child: Column(
            spacing: SpacingSize.lg,
            crossAxisAlignment: .start,
            children: [
              field,

              Text(
                textInfo,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.scheme.onSurfaceVariant,
                ),
              ),

              AppButton(
                onPressed: onPressed,
                label: AppString.saveLabel,
                isLoading: isLoading,
                isDisabled: isOtherLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
