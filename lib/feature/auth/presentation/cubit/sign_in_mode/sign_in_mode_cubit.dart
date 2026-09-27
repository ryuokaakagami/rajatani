import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'sign_in_mode_state.dart';
part 'sign_in_mode_cubit.freezed.dart';
part 'sign_in_mode_cubit.g.dart';

class SignInModeCubit extends HydratedCubit<SignInModeState> {
  new() : super(SignInModeState.email());

  @override
  SignInModeState? fromJson(Map<String, dynamic> json) => SignInModeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SignInModeState state) => state.toJson();

  void changeMode() {
    state.when(email: () => emit(const SignInModeState.phone()), phone: () => emit(const SignInModeState.email()));
  }
}
