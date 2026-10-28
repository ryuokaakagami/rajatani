import '../../../../core/media/services/media_service.dart';
import '../entities/avatar_upload_job.dart';

class DiscardAvatarJob {
  final MediaService _media;
  const new({required this._media});

  Future<void> call(AvatarUploadJob job) => _media.deleteFile(job.localPath);
}
