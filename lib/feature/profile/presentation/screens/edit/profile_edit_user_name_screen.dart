import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/console.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../../../shared/validator/app_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../../utils/user_name_formatter.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditUserNameScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditUserNameScreen> createState() =>
      _ProfileEditUserNameScreenState();
}

class _ProfileEditUserNameScreenState extends State<ProfileEditUserNameScreen> {
  final _controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _validator = AppValidator.username;

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
        validator: _validator.call,
        prefixIcon: Icon(AppIcon.mention),
        hintText: ProfileString.edit.userNameHint,
        formatters: [UserNameFormatter(), LengthLimitingTextInputFormatter(30)],
      ),
      title: ProfileString.detail.usernameMenu,
      textInfo: ProfileString.edit.userNameHelper,
    );
  }
}
