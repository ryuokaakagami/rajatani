import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/user/entities/user_entity.dart';
import '../../../../../core/domain/user/enums/gender.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/user/cubit/user_cubit.dart';
import '../../../../../shared/validator/rules/required_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../../data/models/profile_update.dart';
import '../../extensions/gender_sheet_x.dart';
import '../../extensions/profile_edit_x.dart';
import '../../cubit/edit/profile_edit_cubit.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditGenderScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditGenderScreen> createState() =>
      _ProfileEditGenderScreenState();
}

class _ProfileEditGenderScreenState extends State<ProfileEditGenderScreen> {
  late final UserEntity _user = context.read<UserCubit>().state.data!;
  String get _id => _user.id;
  Gender? get _gender => _user.gender;

  late final TextEditingController _controller;
  late final ValueNotifier<Gender?> _notifier;

  final _key = GlobalKey<FormState>();
  final _validator = RequiredValidator(
    fieldName: ProfileString.detail.genderMenu,
  );

  @override
  void initState() {
    super.initState();
    _notifier = ValueNotifier<Gender?>(_gender);
    _controller = TextEditingController(text: _gender?.label ?? '');
  }

  void _handleSaved() {
    final isValidate = _key.currentState?.validate() ?? false;
    final gender = _notifier.value;

    final isChanged = gender != _user.gender;
    final isValid = isValidate && isChanged;

    final cubit = context.read<ProfileEditCubit>();

    if (isValid) {
      final newData = ProfileUpdate(gender: gender);

      cubit.update(userId: _id, data: newData);
    }
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
      },
    );
  }
}
