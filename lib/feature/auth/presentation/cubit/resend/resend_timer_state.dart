part of 'resend_timer_cubit.dart';

@freezed
abstract class ResendTimerState with _$ResendTimerState {
  const new _();

  const factory ResendTimerState.initial(int increment) = _Initial;
  const factory ResendTimerState.progress({@Default(0) int remaining, required int increment}) =
      _Progress;

  int get remaining => maybeWhen(progress: (remaining, _) => remaining, orElse: () => 0);
  bool get canResend => maybeWhen(progress: (remaining, _) => remaining == 0, orElse: () => true);
}
