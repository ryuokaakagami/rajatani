import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/session/use_cases/observe_session.dart';
import '../../../core/domain/session/use_cases/sign_out.dart';
import '../../../core/error/app_exception.dart';

part 'session_state.dart';
part 'session_cubit.freezed.dart';

class SessionCubit extends Cubit<SessionState> {
  final ObserveSession _observeSession;
  final SignOut _signOut;

  StreamSubscription? _subscription;

  new({required this._observeSession, required this._signOut})
    : super(SessionState.initial()) {
    monitorSession();
  }

  void monitorSession() async {
    _subscription?.cancel();

    emit(SessionState.loading());

    _subscription = _observeSession.call().listen((session) {
      if (session != null) {
        emit(SessionState.authenticated(session.user.id));
        return;
      }
      emit(SessionState.unAuthentacted());
    }, onError: (_, _) => emit(SessionState.error(UnknownException().message)));
  }

  void signOut() async {
    emit(SessionState.loading());

    final result = await _signOut.call();

    result.fold((e) => emit(SessionState.error(e.message)), (_) => null);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
