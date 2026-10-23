import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/app_exception.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../../../shared/validator/app_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../../data/models/profile_update.dart';
import '../../../extensions/profile_edit_x.dart';
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
  String? get _id => widget.id;
  String? get _username => widget.username;
  DateTime? get _usernameUpdatedAt => widget.usernameUpdatedAt;

  late final TextEditingController _controller;
  late final _isUsernameAvailable = ValueNotifier<bool>(false);
  final _key = GlobalKey<FormState>();
  final _validator = AppValidator.username;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _username);
  }

  void _handleSaved() async {
    final isValid =
        _isUsernameAvailable.value && (_key.currentState?.validate() ?? false);

    final cubit = context.read<ProfileEditCubit>();

    if (isValid) {
      final newData = ProfileUpdate(username: _controller.text.toCleanSpace);
      await cubit.update(userId: _id ?? '', data: newData);
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
        context.handleProfileEditState(state: state, userId: _id ?? '');
      },
      builder: (context, state) {
        return BlocConsumer<CheckUsernameCubit, CheckUsernameState>(
          listener: (context, checkState) {
            checkState.maybeWhen(
              error: (message, isCustomError) {
                if (!isCustomError) context.snackBarError(message);
              },
              orElse: () {},
            );
          },
          builder: (context, checkState) {
            _isUsernameAvailable.value = checkState.isAvailable;
            final String? customErrorText = checkState.maybeWhen(
              error: (message, isCustomError) => isCustomError ? message : null,
              orElse: () => null,
            );
            return ProfileEditLayout(
              formKey: _key,
              onPressed: _handleSaved,
              isLoading: state.isLoading,
              isOtherLoading: checkState.isLoading,
              field: AppField(
                isLoading: checkState.isLoading,
                isDisabled: state.isLoading,
                onTap: _usernameUpdatedAt.isInCooldown
                    ? () {
                        context.dialogInfo(
                          title: 'Username Cooldown',
                          message: UsernameCooldownException().message,
                        );
                      }
                    : null,
                onSubmitted: (_) => _handleSaved(),
                onChanged: (value) => context.read<CheckUsernameCubit>().call(
                  value ?? '',
                  _id ?? '',
                ),
                controller: _controller,
                validator: _validator.call,
                prefixIcon: Icon(AppIcon.mention),
                hintText: ProfileString.edit.userNameHint,
                readOnly: _usernameUpdatedAt.isInCooldown,
                errorText: customErrorText,
                formatters: [
                  UserNameFormatter(),
                  LengthLimitingTextInputFormatter(30),
                ],
              ),
              title: ProfileString.detail.usernameMenu,
              textInfo: ProfileString.edit.userNameHelper,
            );
          },
        );
      },
    );
  }
}
