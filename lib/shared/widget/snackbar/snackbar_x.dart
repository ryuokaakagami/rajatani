part of 'snackbar.dart';

extension SnackbarX on BuildContext {
  void snackBarInfo(String message) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      AppSnackbar.build(
        message: message,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onInfo,
        borderColor: scheme.info,
        textTheme: textTheme,
      ),
    );
  }

  void snackBarSuccess(String message) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      AppSnackbar.build(
        message: message,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSuccess,
        borderColor: scheme.success,
        textTheme: textTheme,
      ),
    );
  }

  void snackBarWarning(String message) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      AppSnackbar.build(
        message: message,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onWarning,
        borderColor: scheme.warning,
        textTheme: textTheme,
      ),
    );
  }

  void snackBarError(String message) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      AppSnackbar.build(
        message: message,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onError,
        borderColor: scheme.error,
        textTheme: textTheme,
      ),
    );
  }
}
