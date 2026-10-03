import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Console {
  const Console._();

  static final Logger _logger = Logger(
    filter: ProductionFilter(),
    level: _level,
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 4,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static Level get _level {
    if (kReleaseMode) return Level.off;
    if (kProfileMode) return Level.warning;
    return Level.debug;
  }

  static void info({required String message}) => _logger.i(message);
  static void debug({required String message}) => _logger.d(message);
  static void warning({required String message}) => _logger.w(message);

  static void fatal({required String message}) {
    _logger.f(message);
    _record(null, stackTrace: null, reason: message);
  }

  static void error(
    dynamic e, {
    StackTrace? stackTrace,
    required String message,
  }) {
    _logger.e(message, error: e, stackTrace: stackTrace);
    _record(e, stackTrace: stackTrace, reason: message);
  }

  static void _record(
    dynamic e, {
    StackTrace? stackTrace,
    String? reason,
    bool fatal = false,
  }) {
    if (kDebugMode) return;
    FirebaseCrashlytics.instance.recordError(
      e,
      stackTrace,
      reason: reason,
      fatal: fatal,
    );
  }
}
