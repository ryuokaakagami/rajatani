part of 'avatar_cubit.dart';

@freezed
class AvatarState with _$AvatarState {
  const new _();

  const factory AvatarState.initial() = _Initial;
  const factory AvatarState.loading() = _Loading;
  const factory AvatarState.success() = _Success;
  const factory AvatarState.error({
    required String message,
    @Default(false) bool retryable,
  }) = _Error;

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
}
