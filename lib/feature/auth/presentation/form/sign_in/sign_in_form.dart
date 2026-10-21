import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../shared/constant/app_icon.dart';
import '../../../../../shared/constant/app_string.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../../../shared/validator/app_validator.dart';
import '../../../../../shared/widget/button/button.dart';
import '../../../../../shared/widget/field/field.dart';
import '../../../constants/auth_string.dart';
import '../../cubit/sign_in_mode/sign_in_mode_cubit.dart';
import '../../widgets/auth_form.dart';
import '../../widgets/auth_mode_switcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part '_email_form.dart';
part '_phone_form.dart';

class SignInForm extends StatelessWidget {
  final ValueChanged<String>? signInWithEmail, signInWithPhone;
  final bool isLoading, isOtherLoading;

  const new({
    super.key,
    this.signInWithEmail,
    this.signInWithPhone,
    required this.isLoading,
    required this.isOtherLoading,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SignInModeCubit>().state;
    return AuthModeSwitcher(
      child: state.maybeWhen(
        email: () => _EmailForm(
          onSignIn: signInWithEmail,
          isLoading: isLoading,
          isOtherLoading: isOtherLoading,
        ),
        phone: () => _PhoneForm(
          onSignIn: signInWithPhone,
          isLoading: isLoading,
          isOtherLoading: isOtherLoading,
        ),
        orElse: () => _EmailForm(
          onSignIn: signInWithEmail,
          isLoading: isLoading,
          isOtherLoading: isOtherLoading,
        ),
      ),
    );
  }
}
