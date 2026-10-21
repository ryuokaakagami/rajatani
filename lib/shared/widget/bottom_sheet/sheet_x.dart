import 'package:flutter/material.dart';

import 'bottom_sheet_layout.dart';

extension SheetX on BuildContext {
  Future<T?> showAppBottomSheet<T>({
    required List<Widget> Function(BuildContext context) builder,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      showDragHandle: true,
      builder: (context) {
        return BottomSheetLayout(children: builder(context));
      },
    );
  }
}
