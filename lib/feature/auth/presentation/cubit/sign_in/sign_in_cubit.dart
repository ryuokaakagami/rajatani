import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  new() : super(SignInState.initial());

  Future<void> signInWithEmail(String email) async {
    emit(SignInState.loading(.form));
    await Future.delayed(const Duration(seconds: 3));
    if (email != 'rajatani@example.com') {
      emit(SignInState.error('Alamat email yang anda masukan, tidak diketahui'));
      return;
    }
    emit(SignInState.success(method: .form, contact: email));
  }

  Future<void> signInWithPhone(String phone) async {
    emit(SignInState.loading(.form));
    await Future.delayed(const Duration(seconds: 3));
    if (phone != '628123456789') {
      emit(SignInState.error('Nomor handphone yang anda masukan, tidak diketahui'));
      return;
    }
    emit(SignInState.success(method: .form, contact: phone));
  }

  Future<void> signInWithGoogle() async {
    emit(SignInState.loading(.google));
    await Future.delayed(const Duration(seconds: 3));
    emit(SignInState.success(method: .google));
  }
}
