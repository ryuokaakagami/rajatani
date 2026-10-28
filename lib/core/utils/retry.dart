import 'package:dartz/dartz.dart';

import '../error/app_exception.dart';

bool isTransient(AppException e) =>
    e is NetworkException ||
    e is TimeOutException ||
    e is StorageServerException;

Future<Either<AppException, T>> retry<T>({
  required Future<Either<AppException, T>> Function() doAction,
  int maxAttempts = 3,
  Duration baseDelay = const Duration(seconds: 1),
  bool Function(AppException e) shouldRetry = isTransient,
}) async {
  var attempt = 0;
  while (true) {
    attempt++;
    final result = await doAction();
    final error = result.fold<AppException?>((e) => e, (_) => null);

    if (error == null || attempt >= maxAttempts || !shouldRetry(error)) {
      return result;
    }
    await Future.delayed(baseDelay * (1 << (attempt - 1)));
  }
}
