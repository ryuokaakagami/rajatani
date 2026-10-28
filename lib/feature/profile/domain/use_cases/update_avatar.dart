import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/media/services/media_service.dart';
import '../../../../core/utils/retry.dart';
import '../entities/avatar_upload_job.dart';
import '../repositories/profile_repository.dart';

class UpdateAvatar {
  final ProfileRepository _repository;
  final MediaService _media;

  const new({required this._repository, required this._media});

  Future<Either<AppException, Unit>> call({
    required AvatarUploadJob job,
  }) async {
    final uploaded = await _upload(job);
    final result = await _then(
      uploaded,
      () => _save(job.userId, job.storagePath),
    );

    if (result.isRight()) {
      _removeOld(job.oldPath, job.storagePath);
      unawaited(_media.deleteFile(job.localPath));
    }

    return result;
  }

  Future<Either<AppException, Unit>> _upload(AvatarUploadJob job) async {
    if (job.uploaded) return const Right(unit);

    final result = await retry(
      doAction: () => _repository.uploadAvatar(
        path: job.storagePath,
        file: File(job.localPath),
      ),
    );

    final normalized = result.fold<Either<AppException, Unit>>(
      (e) =>
          e is FileAlreadyExistsStorageException ? const Right(unit) : Left(e),
      Right.new,
    );

    if (normalized.isRight()) job.uploaded = true;
    return normalized;
  }

  Future<Either<AppException, Unit>> _save(String userId, String storagePath) {
    final url = _repository.avatarPublicUrl(path: storagePath);
    return retry(
      doAction: () =>
          _repository.setAvatar(userId: userId, url: url, path: storagePath),
    );
  }

  void _removeOld(String? oldPath, String storagePath) {
    if (oldPath == null || oldPath == storagePath) return;
    unawaited(_repository.removeAvatar(path: oldPath));
  }

  Future<Either<AppException, B>> _then<A, B>(
    Either<AppException, A> input,
    Future<Either<AppException, B>> Function() next,
  ) => input.fold((e) async => Left(e), (_) => next());
}
