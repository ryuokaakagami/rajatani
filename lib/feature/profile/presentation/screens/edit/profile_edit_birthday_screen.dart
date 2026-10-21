import 'package:flutter/material.dart';

import '../../../../../core/utils/console.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../../../shared/validator/rules/required_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../../extensions/birthday_sheet_x.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditBirthdayScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditBirthdayScreen> createState() =>
      _ProfileEditBirthdayScreenState();
}

class _ProfileEditBirthdayScreenState extends State<ProfileEditBirthdayScreen> {
  final _controller = TextEditingController();
  late final _notifier = ValueNotifier<DateTime?>(null);

  final _key = GlobalKey<FormState>();
  final _validator = RequiredValidator(
    fieldName: ProfileString.detail.birthdayMenu,
  );

  void _handleSaved() {
    final isValid = _key.currentState?.validate() ?? false;
    if (!isValid) return;

    final DateTime? birthday = _notifier.value;

    final formattedBirthday = birthday?.toIso8601String() ?? '';

    Console.info(message: formattedBirthday);
  }

  Future<void> _showSheetBirthday() async {
    final date = await context.showBirthdaySheetSelector(
      current: _notifier.value,
    );
    if (!mounted || date == null) return;

    _notifier.value = date;
    _controller.text = date.toFormat;
  }

  @override
  void dispose() {
    _controller.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileEditLayout(
      formKey: _key,
      onPressed: _handleSaved,
      field: AppField(
        onTap: _showSheetBirthday,
        onSubmitted: (_) => _handleSaved(),
        controller: _controller,
        validator: _validator.validate,
        prefixIcon: Icon(AppIcon.calendar),
        hintText: ProfileString.edit.birthdayHint,
        readOnly: true,
      ),
      title: ProfileString.detail.birthdayMenu,
      textInfo: ProfileString.edit.birthdayHelper,
    );
  }
}
