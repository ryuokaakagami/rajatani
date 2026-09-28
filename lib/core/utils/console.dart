import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Console {
  const new _();

  static final Logger _logger = Logger(
    level: kDebugMode ? Level.debug : Level.error,
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 4,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static Logger get logger => _logger;

  static void info({required String message}) => _logger.i(message);
  static void debug({required String message}) => _logger.d(message);
  static void error(dynamic e, {StackTrace? stackTrace, required String message}) =>
      _logger.e(message, error: e, stackTrace: stackTrace);
  static void warning({required String message}) => _logger.w(message);
  static void fatal({required String message}) => _logger.f(message);
}
