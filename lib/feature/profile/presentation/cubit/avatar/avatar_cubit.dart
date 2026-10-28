import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/retry.dart';
import '../../../../feature.dart';

part 'avatar_state.dart';
part 'avatar_cubit.freezed.dart';

class AvatarCubit extends Cubit<AvatarState> {
  final PrepareAvatar _prepareAvatar;
  final UpdateAvatar _updateAvatar;
  final DeleteAvatar _deleteAvatar;
  final DiscardAvatarJob _discardAvatarJob;

  AvatarUploadJob? _job;

  new({
    required this._prepareAvatar,
    required this._updateAvatar,
    required this._deleteAvatar,
    required this._discardAvatarJob,
  }) : super(AvatarState.initial());

  Future<void> change({
    required String userId,
    required String path,
    String? oldPath,
  }) async {
    await _discard();
    emit(AvatarState.loading());

    final prepared = await _prepareAvatar.call(
      userId: userId,
      croppedPath: path,
      oldPath: oldPath,
    );

    final job = prepared.fold<AvatarUploadJob?>((_) => null, (j) => j);

    if (isClosed) {
      if (job != null) await _discardAvatarJob.call(job);
      return;
    }

    if (job == null) {
      emit(
        AvatarState.error(message: prepared.fold((e) => e.message, (_) => '')),
      );
      return;
    }

    _job = job;
    await _upload();
  }

  Future<void> delete({required String userId, String? oldPath}) async {
    emit(AvatarState.loading());

    final result = await _deleteAvatar.call(userId: userId, oldPath: oldPath);
    if (isClosed) return;

    result.fold(
      (e) => emit(AvatarState.error(message: e.message)),
      (_) => emit(AvatarState.success()),
    );
  }

  Future<void> retry() async {
    if (_job == null) return;
    emit(AvatarState.loading());
    await _upload();
  }

  Future<void> cancel() async {
    await _discard();
    if (!isClosed) emit(AvatarState.initial());
  }

  Future<void> _upload() async {
    final job = _job;
    if (job == null) return;

    final result = await _updateAvatar.call(job: job);
    if (isClosed) return;

    final error = result.fold((e) => e, (_) => null);

    if (error == null) {
      _job = null;
      emit(AvatarState.success());
    } else if (isTransient(error)) {
      emit(AvatarState.error(message: error.message, retryable: true));
    } else {
      await _discard();
      if (isClosed) return;
      emit(AvatarState.error(message: error.message));
    }
  }

  Future<void> _discard() async {
    final job = _job;
    if (job == null) return;
    _job = null;
    await _discardAvatarJob.call(job);
  }

  @override
  Future<void> close() async {
    await _discard();
    return super.close();
  }
}
