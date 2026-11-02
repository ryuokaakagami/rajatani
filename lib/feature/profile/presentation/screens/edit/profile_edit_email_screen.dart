import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/domain/user/entities/user_entity.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/extension/string_x.dart';
import '../../../../../shared/user/cubit/user_cubit.dart';
import '../../../../../shared/validator/app_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../cubit/contact/contact_update_cubit.dart';
import '../../extensions/verify_contact_update_x.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditEmailScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditEmailScreen> createState() => _ProfileEditEmailScreenState();
}

class _ProfileEditEmailScreenState extends State<ProfileEditEmailScreen> {
  late final UserEntity _user = context.read<UserCubit>().state.data!;
  String? get _email => _user.email;

  late final TextEditingController _controller;
  final _key = GlobalKey<FormState>();
  final _validator = AppValidator.email;

  @override
  void initState() {
    _controller = TextEditingController(text: _email);
    super.initState();
  }

  void _handleSaved() {
    final isValidate = _key.currentState?.validate() ?? false;
    final email = _controller.text.toCleanSpace;
    final isChanged = _email?.toCleanSpace != email;

    if (isValidate && isChanged) {
      context.read<ContactUpdateCubit>().request(
        contact: email,
        isPhone: false,
      );
    }
  }

  Future<void> _openSheet() async {
    final done = await context.showVerifyContactUpdateSheet(
      oldContact: _email,
      newContact: _controller.text.toCleanSpace,
    );
    if (!mounted) return;
    if (done == true) {
      context.read<UserCubit>().fetch(_user.id);
      context.pop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUpdateCubit, ContactUpdateState>(
      listenWhen: (p, _) => p.isRequestLoading,
      listener: (context, state) {
        state.maybeWhen(
          success: (_) => _openSheet(),
          error: (message) => context.snackBarError(message),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return ProfileEditLayout(
          formKey: _key,
          onPressed: _handleSaved,
          isLoading: state.isRequestLoading,
          isOtherLoading: state.isLoading,
          field: AppField(
            onSubmitted: (_) => _handleSaved(),
            isDisabled: state.isLoading,
            controller: _controller,
            validator: _validator.call,
            prefixIcon: Icon(AppIcon.email),
            hintText: AppString.emailHint,
            type: .emailAddress,
          ),
          title: AppString.emailLabel,
          textInfo: ProfileString.edit.emailHelper,
        );
      },
    );
  }
}
