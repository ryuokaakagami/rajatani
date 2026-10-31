part of 'user_cubit.dart';

@freezed
abstract class UserState with _$UserState {
  const new _();

  const factory UserState.initial() = _Initial;
  const factory UserState.loading({UserEntity? data}) = _Loading;
  const factory UserState.loaded({UserEntity? data}) = _Loaded;
  const factory UserState.error({UserEntity? data, required String message}) =
      _Error;

  bool get isLoading => maybeWhen(loading: (_) => true, orElse: () => false);

  UserEntity? get data => mapOrNull(
    loading: (s) => s.data,
    loaded: (s) => s.data,
    error: (s) => s.data,
  );
}
