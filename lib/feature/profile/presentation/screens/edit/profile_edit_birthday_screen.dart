import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/user/entities/user_entity.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/cubit/user/user_cubit.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../../../shared/validator/rules/required_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../../data/models/profile_update.dart';
import '../../extensions/birthday_sheet_x.dart';
import '../../extensions/profile_edit_x.dart';
import '../../cubit/edit/profile_edit_cubit.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditBirthdayScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditBirthdayScreen> createState() =>
      _ProfileEditBirthdayScreenState();
}

class _ProfileEditBirthdayScreenState extends State<ProfileEditBirthdayScreen> {
  late final UserEntity _user = context.read<UserCubit>().state.data!;
  String get _id => _user.id;
  DateTime? get _birthday => _user.birthday;

  late final TextEditingController _controller;
  late final ValueNotifier<DateTime?> _notifier;

  final _key = GlobalKey<FormState>();
  final _validator = RequiredValidator(
    fieldName: ProfileString.detail.birthdayMenu,
  );

  @override
  void initState() {
    super.initState();
    _notifier = ValueNotifier<DateTime?>(_birthday);
    _controller = TextEditingController(text: _birthday?.toFormat ?? '');
  }

  void _handleSaved() {
    final isValidate = _key.currentState?.validate() ?? false;
    final birthday = _notifier.value;
    final isChanged = birthday != _birthday;

    final isValid = isValidate && isChanged;

    final cubit = context.read<ProfileEditCubit>();

    if (isValid) {
      final newData = ProfileUpdate(birthday: birthday);

      cubit.update(userId: _id, data: newData);
    }
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
    return BlocConsumer<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        context.handleProfileEditState(state: state, userId: _id);
      },
      builder: (context, state) {
        return ProfileEditLayout(
          formKey: _key,
          onPressed: _handleSaved,
          isLoading: state.isLoading,
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
      },
    );
  }
}
