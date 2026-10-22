abstract class DatabaseClient {
  Future<Map<String, dynamic>?> read(
    String table, {
    required String column,
    required String value,
  });

  Future<Map<String, dynamic>> insert(
    String table, {
    required Map<String, dynamic> data,
  });

  Future<void> update(
    String table, {
    required Map<String, dynamic> data,
    required String column,
    required String value,
  });

  Future<void> delete(
    String table, {
    required String column,
    required String value,
  });

  Future<T> rpc<T>(String function, {Map<String, dynamic>? params});
}
