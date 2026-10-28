import 'package:supabase_flutter/supabase_flutter.dart';

import '../../error/app_exception.dart';
import 'database_client.dart';

class SupabaseDatabaseClient implements DatabaseClient {
  final SupabaseClient _supabase;

  const new({required this._supabase});

  @override
  Future<Map<String, dynamic>?> read(
    String table, {
    required String column,
    required String value,
  }) => _supabase.from(table).select().eq(column, value).maybeSingle();

  @override
  Future<Map<String, dynamic>> insert(
    String table, {
    required Map<String, dynamic> data,
  }) => _supabase.from(table).insert(data).select().single();

  @override
  Future<void> update(
    String table, {
    required Map<String, dynamic> data,
    required String column,
    required String value,
  }) async {
    final result = await _supabase
        .from(table)
        .update(data)
        .eq(column, value)
        .select();

    if (result.isEmpty) throw const DatabaseNotFoundException();
  }

  @override
  Future<void> delete(
    String table, {
    required String column,
    required String value,
  }) async {
    final result = await _supabase
        .from(table)
        .delete()
        .eq(column, value)
        .select();

    if (result.isEmpty) throw const DatabaseNotFoundException();
  }

  @override
  Future<T> rpc<T>(String function, {Map<String, dynamic>? params}) async {
    return await _supabase.rpc(function, params: params) as T;
  }
}
