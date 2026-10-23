import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/app_exception.dart';
import '../../../../../core/utils/debouncer.dart';
import '../../../domain/use_cases/check_username_available.dart';

part 'check_username_state.dart';
part 'check_username_cubit.freezed.dart';

class CheckUsernameCubit extends Cubit<CheckUsernameState> {
  final CheckUsernameAvailable _checkUsernameAvailable;

  final _debouncer = Debouncer();

  new({required this._checkUsernameAvailable})
    : super(CheckUsernameState.initial());

  void call(String value, String userId) {
    _debouncer.run(() async {
      emit(CheckUsernameState.loading());

      final result = await _checkUsernameAvailable.call(
        username: value,
        userId: userId,
      );

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

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
