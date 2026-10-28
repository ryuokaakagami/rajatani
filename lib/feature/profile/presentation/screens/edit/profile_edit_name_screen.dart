import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/user/entities/user_entity.dart';
import '../../../../../shared/shared.dart';
import '../../../constants/profile_string.dart';
import '../../../data/models/profile_update.dart';
import '../../extensions/profile_edit_x.dart';
import '../../cubit/edit/profile_edit_cubit.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditNameScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditNameScreen> createState() => _ProfileEditNameScreenState();
}

class _ProfileEditNameScreenState extends State<ProfileEditNameScreen> {
  late final UserEntity _user = context.read<UserCubit>().state.data!;
  String get _id => _user.id;
  String? get _name => _user.fullname;

  late final TextEditingController _controller;
  final _key = GlobalKey<FormState>();
  final _validator = RequiredValidator(
    fieldName: ProfileString.detail.nameMenu,
  );

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _name);
  }

  void _handleSaved() {
    final isValidate = _key.currentState?.validate() ?? false;
    final name = _controller.text.toCleanSpace;
    final isChanged = _name?.toCleanSpace != name;
    final isValid = isValidate && isChanged;

    final cubit = context.read<ProfileEditCubit>();

    if (isValid) {
      final newData = ProfileUpdate(fullname: name);
      cubit.update(userId: _id, data: newData);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
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
      },
    );
  }
}
