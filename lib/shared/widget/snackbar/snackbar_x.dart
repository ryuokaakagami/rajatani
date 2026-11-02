import 'package:flutter/material.dart';

import 'app_snackbar.dart';

extension SnackbarX on BuildContext {
  void snackBarInfo(String m) =>
      AppSnackbar.show(this, message: m, type: SnackbarType.info);
  void snackBarSuccess(String m) =>
      AppSnackbar.show(this, message: m, type: SnackbarType.success);
  void snackBarWarning(String m) =>
      AppSnackbar.show(this, message: m, type: SnackbarType.warning);
  void snackBarError(String m) =>
      AppSnackbar.show(this, message: m, type: SnackbarType.error);
}
