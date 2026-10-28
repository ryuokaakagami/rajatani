import 'dart:io';

import 'storage_bucket.dart';

abstract class StorageClient {
  Future<String> upload(
    StorageBucket bucket, {
    required String path,
    required File file,
    required String contentType,
    bool upsert = false,
  });

  String publicUrl(StorageBucket bucket, {required String path});

  Future<void> remove(StorageBucket bucket, {required List<String> paths});
}
