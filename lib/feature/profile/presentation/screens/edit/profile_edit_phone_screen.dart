import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/domain/user/entities/user_entity.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../../../shared/user/cubit/user_cubit.dart';
import '../../../../../shared/validator/app_validator.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../cubit/contact/contact_update_cubit.dart';
import '../../extensions/verify_contact_update_x.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditPhoneScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditPhoneScreen> createState() => _ProfileEditPhoneScreenState();
}

class _ProfileEditPhoneScreenState extends State<ProfileEditPhoneScreen> {
  late final UserEntity _user = context.read<UserCubit>().state.data!;
  String? get _phone => _user.phone;

  late final TextEditingController _controller;
  final _key = GlobalKey<FormState>();
  final _validator = AppValidator.phone;

  @override
  void initState() {
    _controller = TextEditingController(text: _phone);
    super.initState();
  }

  void _handleSaved() {
    final isValidate = _key.currentState?.validate() ?? false;
    final phone = _controller.text.toCleanSpace.normalizePhone;
    final isChanged = _phone?.toCleanSpace != phone;

    if (isValidate && isChanged) {
      context.read<ContactUpdateCubit>().request(contact: phone, isPhone: true);
    }
  }

  Future<void> _openSheet() async {
    final done = await context.showVerifyContactUpdateSheet(
      newContact: _controller.text.toCleanSpace.normalizePhone,
      isPhone: true,
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
            prefixIcon: Icon(AppIcon.phone),
            hintText: AppString.phoneHint,
            type: .number,
            formatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          title: AppString.phoneLabel,
          textInfo: ProfileString.edit.phoneHelper,
        );
      },
    );
  }
}
