part of 'user_cubit.dart';

@freezed
abstract class UserState with _$UserState {
  const new _();

  const factory UserState.initial({UserEntity? data}) = _Initial;
  const factory UserState.loading({UserEntity? data}) = _Loading;
  const factory UserState.loaded({UserEntity? data}) = _Loaded;
  const factory UserState.error({UserEntity? data, required String message}) =
      _Error;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  bool get isLoading => maybeWhen(loading: (_) => true, orElse: () => false);
}
