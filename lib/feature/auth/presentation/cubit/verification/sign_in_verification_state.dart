part of 'sign_in_verification_cubit.dart';

enum VerificationAction { verify, resend }

@freezed
abstract class SignInVerificationState with _$SignInVerificationState {
  const new _();

  const factory SignInVerificationState.initial() = _Initial;

  const factory SignInVerificationState.loading({
    required String contact,
    required VerificationAction action,
    @Default(false) bool isPhoneMode,
  }) = _Loading;

  const factory SignInVerificationState.success({
    required String contact,
    required VerificationAction action,
    @Default(false) bool isPhoneMode,
  }) = _Success;

  const factory SignInVerificationState.error(String message) = _Error;

  bool get isVerifyLoading => maybeWhen(
    loading: (contact, action, isPhoneMode) => action == .verify,
    orElse: () => false,
  );

  bool get isResendLoading => maybeWhen(
    loading: (contact, action, isPhoneMode) => action == .resend,
    orElse: () => false,
  );
}
