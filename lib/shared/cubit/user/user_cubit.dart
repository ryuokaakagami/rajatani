import 'dart:async';
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../core/core.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';
part 'user_cubit.g.dart';

class UserCubit extends HydratedCubit<UserState> {
  final FetchDataUser _fetchDataUser;
  final ObserveSession _observeSession;
  late final StreamSubscription _subscription;

  new({required this._fetchDataUser, required this._observeSession})
    : super(UserState.initial()) {
    _subscription = _observeSession.call().listen((session) {
      if (session != null) {
        fetch(session.user.id);
        return;
      }
      _clearUserData();
    });
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      return UserState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }

  Future<void> fetch(String userId) async {
    final cache = state.data;

    emit(UserState.loading(data: cache));
    final result = await _fetchDataUser.call(userId);

    result.fold((e) => emit(UserState.error(message: e.message)), (data) {
      const encoder = JsonEncoder.withIndent(' ');
      final prettyData = encoder.convert(data?.toJson() ?? {'profile': null});

      Console.info(message: '\n$prettyData');
      emit(UserState.loaded(data: data));
    });
  }

  void _clearUserData() {
    emit(const UserState.initial());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
