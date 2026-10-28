import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/domain/user/entities/user_entity.dart';
import '../../../../../core/error/app_exception.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/cubit/user/user_cubit.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../../../shared/validator/app_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../../data/models/profile_update.dart';
import '../../extensions/profile_edit_x.dart';
import '../../../extensions/username_x.dart';
import '../../../utils/user_name_formatter.dart';
import '../../cubit/edit/profile_edit_cubit.dart';
import '../../cubit/username/check_username_cubit.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditUserNameScreen extends StatefulWidget {
  final String? id, username;
  final DateTime? usernameUpdatedAt;

  const new({super.key, this.id, this.username, this.usernameUpdatedAt});

  @override
  State<ProfileEditUserNameScreen> createState() =>
      _ProfileEditUserNameScreenState();
}

class _ProfileEditUserNameScreenState extends State<ProfileEditUserNameScreen> {
  late final UserEntity _user = context.read<UserCubit>().state.data!;

  String get _id => _user.id;
  String? get _username => _user.username;
  bool get _inCooldown => _user.usernameUpdatedAt.isInCooldown;

  late final TextEditingController _controller;
  final _key = GlobalKey<FormState>();
  final _validator = AppValidator.username;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _username);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showCooldownDialog() {
    context.dialogInfo(
      title: 'Username Cooldown',
      message: UsernameCooldownException().message,
    );
  }

  void _handleChanged(String? value) {
    final text = value ?? '';
    final checkCubit = context.read<CheckUsernameCubit>();

    if (_validator.call(text) != null) {
      checkCubit.reset();
      return;
    }

    checkCubit.check(text, _id, current: _username);
  }

  void _handleSaved() {
    if (_inCooldown) return _showCooldownDialog();

    final username = _controller.text.toCleanSpace;
    if (username == _username) return context.pop();

    final isValid = _key.currentState?.validate() ?? false;
    final isAvailable = context.read<CheckUsernameCubit>().state.isAvailable;
    if (!isValid || !isAvailable) return;

    final id = _id;

    context.read<ProfileEditCubit>().update(
      userId: id,
      data: ProfileUpdate(username: username),
    );
  }

  @override
  Widget build(BuildContext context) {
    final editState = context.watch<ProfileEditCubit>().state;
    final checkState = context.watch<CheckUsernameCubit>().state;

    final String? customErrorText = checkState.maybeWhen(
      error: (message, isCustomError) => isCustomError ? message : null,
      orElse: () => null,
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileEditCubit, ProfileEditState>(
          listener: (context, state) {
            context.handleProfileEditState(state: state, userId: _id);
          },
        ),
        BlocListener<CheckUsernameCubit, CheckUsernameState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message, isCustomError) {
                if (!isCustomError) context.snackBarError(message);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: ProfileEditLayout(
        formKey: _key,
        onPressed: _handleSaved,
        isLoading: editState.isLoading,
        isOtherLoading: checkState.isLoading,
        field: AppField(
          isLoading: checkState.isLoading,
          isDisabled: editState.isLoading,
          readOnly: _inCooldown,
          onTap: _inCooldown ? _showCooldownDialog : null,
          onChanged: _handleChanged,
          onSubmitted: (_) => _handleSaved(),
          controller: _controller,
          validator: _validator.call,
          prefixIcon: Icon(AppIcon.mention),
          hintText: ProfileString.edit.userNameHint,
          errorText: customErrorText,
          formatters: [
            UserNameFormatter(),
            LengthLimitingTextInputFormatter(30),
          ],
        ),
        title: ProfileString.detail.usernameMenu,
        textInfo: ProfileString.edit.userNameHelper,
      ),
    );
  }
}
