import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../error/app_exception.dart';
import 'storage_bucket.dart';
import 'storage_client.dart';

class SupabaseFileStorageClient implements StorageClient {
  final SupabaseClient _supabase;

  const new({required this._supabase});

  @override
  Future<String> upload(
    StorageBucket bucket, {
    required String path,
    required File file,
    required String contentType,
    bool upsert = false,
  }) => _supabase.storage
      .from(bucket.id)
      .upload(
        path,
        file,
        fileOptions: FileOptions(contentType: contentType, upsert: upsert),
      );

  @override
  String publicUrl(StorageBucket bucket, {required String path}) =>
      _supabase.storage.from(bucket.id).getPublicUrl(path);

  @override
  Future<void> remove(
    StorageBucket bucket, {
    required List<String> paths,
  }) async {
    final result = await _supabase.storage.from(bucket.id).remove(paths);
    if (result.isEmpty) throw const FileNotFoundStorageException();
  }
}
