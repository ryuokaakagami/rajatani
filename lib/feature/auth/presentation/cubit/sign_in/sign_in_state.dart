part of 'sign_in_cubit.dart';

enum SignInMethod { form, google }

@freezed
abstract class SignInState with _$SignInState {
  const new _();

  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading(SignInMethod method) = _Loading;
  const factory SignInState.success({required SignInMethod method, String? contact}) = _Success;
  const factory SignInState.error(String message) = _Error;

  bool get isFormLoading => maybeWhen(loading: (method) => method == .form, orElse: () => false);
  bool get isGoogleLoading =>
      maybeWhen(loading: (method) => method == .google, orElse: () => false);
}
