part of 'sign_in_mode_cubit.dart';

@freezed
abstract class SignInModeState with _$SignInModeState {
  const new _();

  const factory SignInModeState.email() = _Email;
  const factory SignInModeState.phone() = _Phone;

  factory SignInModeState.fromJson(Map<String, dynamic> json) =>
      _$SignInModeStateFromJson(json);

  bool get isPhoneMode => maybeWhen(phone: () => true, orElse: () => false);
}
