import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_verification_state.dart';
part 'sign_in_verification_cubit.freezed.dart';

class SignInVerificationCubit extends Cubit<SignInVerificationState> {
  new() : super(SignInVerificationState.initial());

  Future<void> verify({
    required String contact,
    required String otp,
    required bool isPhoneMode,
  }) async {
    emit(
      SignInVerificationState.loading(contact: contact, action: .verify, isPhoneMode: isPhoneMode),
    );

    await Future.delayed(const Duration(seconds: 3));

    if (otp != '123456') {
      emit(SignInVerificationState.error('Verifikasi kode tidak diketahui'));
      return;
    }

    emit(
      SignInVerificationState.success(contact: contact, action: .verify, isPhoneMode: isPhoneMode),
    );
  }

  Future<void> resend({required String contact, required bool isPhoneMode}) async {
    emit(
      SignInVerificationState.loading(contact: contact, action: .resend, isPhoneMode: isPhoneMode),
    );

    await Future.delayed(const Duration(seconds: 3));

    emit(
      SignInVerificationState.success(contact: contact, action: .resend, isPhoneMode: isPhoneMode),
    );
  }
}
