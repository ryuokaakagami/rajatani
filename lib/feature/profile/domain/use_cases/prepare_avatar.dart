import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/media/services/media_service.dart';
import '../entities/avatar_upload_job.dart';

class PrepareAvatar {
  final MediaService _media;

  const new({required this._media});

  Future<Either<AppException, AvatarUploadJob>> call({
    required String userId,
    required String croppedPath,
    String? oldPath,
  }) async {
    final converted = await _media.convertToWebp(path: croppedPath);

    await _media.deleteFile(croppedPath);

    return converted.map(
      (localPath) => AvatarUploadJob(
        userId: userId,
        localPath: localPath,
        storagePath: '$userId/RT-${DateTime.now().millisecondsSinceEpoch}.webp',
        oldPath: oldPath,
      ),
    );
  }
}
