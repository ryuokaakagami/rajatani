import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_timer_state.dart';
part 'resend_timer_cubit.freezed.dart';

class ResendTimerCubit extends Cubit<ResendTimerState> {
  Timer? _timer;

  new() : super(ResendTimerState.initial(30)) {
    start();
  }

  void start() {
    _timer?.cancel();

    final current = state.maybeWhen(
      initial: (increment) => increment,
      progress: (_, increment) => increment,
      orElse: () => 1,
    );

    final nextIncrement = (current + 15).clamp(30, 60).toInt();

    emit(
      ResendTimerState.progress(remaining: current, increment: nextIncrement),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remaining > 1) {
        emit(
          ResendTimerState.progress(
            remaining: state.remaining - 1,
            increment: state.increment,
          ),
        );
        return;
      }
      emit(ResendTimerState.initial(state.increment));
      timer.cancel();
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
