import 'package:flutter/material.dart';

import '../../../../../core/utils/console.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/validator/rules/required_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../../data/enum/gender.dart';
import '../../../extensions/gender_sheet_x.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditGenderScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditGenderScreen> createState() =>
      _ProfileEditGenderScreenState();
}

class _ProfileEditGenderScreenState extends State<ProfileEditGenderScreen> {
  final _controller = TextEditingController();
  late final _notifier = ValueNotifier<Gender?>(null);

  final _key = GlobalKey<FormState>();
  final _validator = RequiredValidator(
    fieldName: ProfileString.detail.genderMenu,
  );

  void _handleSaved() {
    final isValid = _key.currentState?.validate() ?? false;
    if (!isValid) return;

    final Gender? gender = _notifier.value;

    Console.info(message: gender?.label ?? '');
  }

  Future<void> _showBottomSheet() async {
    final result = await context.showGenderSheetSelector(
      current: _notifier.value,
    );
    if (!mounted || result == null) return;

    _notifier.value = result.value;
    _controller.text = result.value?.label ?? '';
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
        onTap: _showBottomSheet,
        onSubmitted: (_) => _handleSaved(),
        controller: _controller,
        validator: _validator.validate,
        prefixIcon: Icon(AppIcon.gender),
        hintText: ProfileString.edit.genderHint,
        readOnly: true,
      ),
      title: ProfileString.detail.genderMenu,
      textInfo: ProfileString.edit.genderHelper,
    );
  }
}
