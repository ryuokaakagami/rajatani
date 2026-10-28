import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/widget/bottom_sheet/sheet_x.dart';
import '../../../../shared/widget/button/button.dart';

extension BirthdaySheetX on BuildContext {
  Future<DateTime?> showBirthdaySheetSelector({DateTime? current}) {
    final now = DateTime.now();
    final initial = current ?? DateTime(now.year - 18, now.month, now.day);
    DateTime? selected = current;

    return showAppBottomSheet(
      builder: (context) => [
        SizedBox(
          height: 300.0,
          child: CalendarDatePicker(
            initialDate: initial,
            firstDate: DateTime(1900),
            lastDate: now,
            initialCalendarMode: .year,
            onDateChanged: (date) => selected = date,
          ),
        ),

        Padding(
          padding: const .symmetric(horizontal: SpacingSize.xl),
          child: AppButton(
            onPressed: () => context.pop(selected),
            label: 'Done',
          ),
        ),
      ],
    );
  }
}
