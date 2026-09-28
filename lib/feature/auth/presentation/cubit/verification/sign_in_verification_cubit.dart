import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../feature.dart';

part 'sign_in_verification_state.dart';
part 'sign_in_verification_cubit.freezed.dart';

class SignInVerificationCubit extends Cubit<SignInVerificationState> {
  final SignInVerification _inVerification;
  final SignInResendCode _inResendCode;

  new({required this._inVerification, required this._inResendCode})
    : super(SignInVerificationState.initial());

  Future<void> verify({
    required String contact,
    required String otp,
    required bool isPhoneMode,
  }) async {
    emit(
      SignInVerificationState.loading(
        contact: contact,
        action: .verify,
        isPhoneMode: isPhoneMode,
      ),
    );

    await Future.delayed(const Duration(seconds: 3));

    final result = isPhoneMode
        ? await _inVerification.call(phone: contact, otp: otp)
        : await _inVerification.call(email: contact, otp: otp);

    result.fold(
      (e) => emit(SignInVerificationState.error(e.message)),
      (_) => emit(
        SignInVerificationState.success(
          contact: contact,
          action: .verify,
          isPhoneMode: isPhoneMode,
        ),
      ),
    );
  }

  Future<void> resend({
    required String contact,
    required bool isPhoneMode,
  }) async {
    emit(
      SignInVerificationState.loading(
        contact: contact,
        action: .resend,
        isPhoneMode: isPhoneMode,
      ),
    );

    final result = isPhoneMode
        ? await _inResendCode.call(phone: contact)
        : await _inResendCode.call(email: contact);

    result.fold(
      (e) => emit(SignInVerificationState.error(e.message)),
      (_) => emit(
        SignInVerificationState.success(
          contact: contact,
          action: .resend,
          isPhoneMode: isPhoneMode,
        ),
      ),
    );
  }
}
