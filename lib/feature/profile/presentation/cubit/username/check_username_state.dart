part of 'check_username_cubit.dart';

@freezed
class CheckUsernameState with _$CheckUsernameState {
  const new _();

  const factory CheckUsernameState.initial() = _Initial;
  const factory CheckUsernameState.loading() = _Loading;
  const factory CheckUsernameState.available() = _Available;
  const factory CheckUsernameState.error({
    required String message,
    required bool isCustomError,
  }) = _Error;

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
  bool get isAvailable => maybeWhen(available: () => true, orElse: () => false);
}
