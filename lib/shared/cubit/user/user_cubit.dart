import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../core/core.dart';
import '../../../core/data/user/models/user_model.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends HydratedCubit<UserState> {
  final FetchDataUser _fetchDataUser;
  final ObserveSession _observeSession;
  late final StreamSubscription _subscription;
  String? _fetchedFor;

  new({required this._fetchDataUser, required this._observeSession})
    : super(const UserState.initial()) {
    _subscription = _observeSession.call().listen((session) {
      if (session == null) {
        _fetchedFor = null;
        _clearUserData();
        return;
      }
      final id = session.user.id;
      if (id == _fetchedFor) return;
      _fetchedFor = id;
      fetch(id);
    });
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      return UserState.loaded(data: UserModel.fromJson(json).toEntity());
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    final data = state.data;
    if (data == null) return null;
    return UserModel.fromEntity(data).toJson();
  }

  Future<void> fetch(String userId) async {
    final cache = state.data?.id == userId ? state.data : null;

    emit(UserState.loading(data: cache));
    final result = await _fetchDataUser.call(userId);
    if (isClosed || _fetchedFor != userId) {
      return;
    }

    result.fold(
      (e) => emit(UserState.error(message: e.message, data: cache)),
      (data) => emit(UserState.loaded(data: data)),
    );
  }

  void _clearUserData() {
    emit(const UserState.initial());
    clear();
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
