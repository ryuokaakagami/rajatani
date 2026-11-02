import 'package:flutter/material.dart';

import '../../../../shared/constant/spacing_size.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> children;

  const new({super.key, required this.formKey, required this.children});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: .onUserInteraction,
      child: Column(
        mainAxisSize: .min,
        spacing: SpacingSize.lg,
        children: children,
      ),
    );
  }
}
