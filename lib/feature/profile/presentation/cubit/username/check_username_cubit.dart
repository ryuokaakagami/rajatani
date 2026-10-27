import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/app_exception.dart';
import '../../../../../core/utils/debouncer.dart';
import '../../../../../shared/extension/extension.dart';
import '../../../domain/use_cases/check_username_available.dart';

part 'check_username_state.dart';
part 'check_username_cubit.freezed.dart';

class CheckUsernameCubit extends Cubit<CheckUsernameState> {
  final CheckUsernameAvailable _checkUsernameAvailable;

  final _debouncer = Debouncer();
  int _requestId = 0;

  new({required this._checkUsernameAvailable})
    : super(CheckUsernameState.initial());

  void check(String value, String userId, {String? current}) {
    _debouncer.cancel();
    final id = ++_requestId;
    final username = value.toCleanSpace;

    if (username.isEmpty || username == current) {
      emit(CheckUsernameState.initial());
      return;
    }

    emit(CheckUsernameState.loading());

    _debouncer.run(() async {
      final result = await _checkUsernameAvailable.call(
        username: value,
        userId: userId,
      );

      if (isClosed || id != _requestId) return;

      result.fold(
        (e) => emit(
          CheckUsernameState.error(
            message: e.message,
            isCustomError: e is UsernameException,
          ),
        ),
        (_) => emit(CheckUsernameState.available()),
      );
    });
  }

  void reset() {
    _debouncer.cancel();
    _requestId++;
    emit(CheckUsernameState.initial());
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
