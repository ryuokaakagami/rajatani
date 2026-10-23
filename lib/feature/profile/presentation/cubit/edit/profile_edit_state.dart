part of 'profile_edit_cubit.dart';

@freezed
class ProfileEditState with _$ProfileEditState {
  const new _();

  const factory ProfileEditState.initial() = _Initial;
  const factory ProfileEditState.loading() = _Loading;
  const factory ProfileEditState.success() = _Success;
  const factory ProfileEditState.error({required String message}) = _Error;

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
}
