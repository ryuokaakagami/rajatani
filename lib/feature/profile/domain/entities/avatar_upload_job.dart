class AvatarUploadJob {
  final String userId, localPath, storagePath;
  final String? oldPath;
  bool uploaded;

  AvatarUploadJob({
    required this.userId,
    required this.localPath,
    required this.storagePath,
    this.oldPath,
    this.uploaded = false,
  });
}
