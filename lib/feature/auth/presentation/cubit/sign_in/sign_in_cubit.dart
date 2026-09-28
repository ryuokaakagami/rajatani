import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../feature.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInWithOtp _inWithOtp;
  final SignInWithGoogle _inWithGoogle;

  new({required this._inWithOtp, required this._inWithGoogle})
    : super(SignInState.initial());

  Future<void> signInWithEmail(String email) async {
    emit(SignInState.loading(.form));
    final result = await _inWithOtp.call(email: email);
    result.fold(
      (e) => emit(SignInState.error(e.message)),
      (_) => emit(SignInState.success(method: .form, contact: email)),
    );
  }

  Future<void> signInWithPhone(String phone) async {
    emit(SignInState.loading(.form));
    final result = await _inWithOtp.call(phone: phone);
    result.fold(
      (e) => emit(SignInState.error(e.message)),
      (_) => emit(SignInState.success(method: .form, contact: phone)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInState.loading(.google));
    final result = await _inWithGoogle.call();
    result.fold(
      (e) => emit(SignInState.error(e.message)),
      (_) => emit(SignInState.success(method: .google)),
    );
  }
}
