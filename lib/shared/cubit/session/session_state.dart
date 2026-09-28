part of 'session_cubit.dart';

@freezed
class SessionState with _$SessionState {
  const new _();

  const factory SessionState.initial() = _Initial;
  const factory SessionState.loading() = _Loading;
  const factory SessionState.authenticated(String userId) = _Authenticated;
  const factory SessionState.unAuthentacted() = _UnAuthenticated;
  const factory SessionState.error(String message) = _Error;
}
