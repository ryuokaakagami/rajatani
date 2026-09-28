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
    } on SocketException catch (e, s) {
      Console.error(e, stackTrace: s, message: e.toString());
      return Left(const NetworkException());
    } on TimeoutException catch (e, s) {
      Console.error(e, stackTrace: s, message: e.toString());
      return Left(const TimeOutException());
    } catch (e, s) {
      Console.error(e, stackTrace: s, message: e.toString());
      return Left(customErrorHandler?.call(e) ?? const UnknownException());
    }
  }
}
