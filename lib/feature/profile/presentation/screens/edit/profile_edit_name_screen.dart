import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/console.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../../../shared/validator/rules/required_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditNameScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditNameScreen> createState() => _ProfileEditNameScreenState();
}

class _ProfileEditNameScreenState extends State<ProfileEditNameScreen> {
  final _controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _validator = RequiredValidator(
    fieldName: ProfileString.detail.nameMenu,
  );

  void _handleSaved() {
    final isValid = _key.currentState?.validate() ?? false;
    if (isValid) Console.info(message: _controller.text.toCleanSpace);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileEditLayout(
      formKey: _key,
      onPressed: _handleSaved,
      field: AppField(
        onSubmitted: (_) => _handleSaved(),
        controller: _controller,
        validator: _validator.validate,
        prefixIcon: Icon(AppIcon.user),
        hintText: ProfileString.edit.nameHint,
        formatters: [LengthLimitingTextInputFormatter(50)],
      ),
      title: ProfileString.detail.nameMenu,
      textInfo: ProfileString.edit.nameHelper,
    );
  }
}
