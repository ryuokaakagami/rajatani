import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../error/app_exception.dart';
import 'console.dart';

mixin SafeCall {
  Future<Either<AppException, T>> call<T>({
    required Future<T> Function() doAction,
    AppException? Function(Object e)? customErrorHandler,
  }) async {
    try {
      final result = await doAction();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } on SocketException {
      return Left(const NetworkException());
    } on TimeoutException {
      return Left(const TimeOutException());
    } catch (e, s) {
      Console.error(e, stackTrace: s, message: e.toString());
      final mapped = customErrorHandler?.call(e);
      if (mapped == null) {
        Console.error(e, stackTrace: s, message: e.toString());
      }

      return Left(mapped ?? const UnknownException());
    }
  }
}
