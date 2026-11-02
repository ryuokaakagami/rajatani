import 'package:flutter/material.dart';

import '../../../../shared/widget/bottom_sheet/bottom_sheet.dart';
import '../../../../shared/constant/constant.dart';
import '../../../../shared/widget/button/button.dart';

part '../widgets/_birthday_sheet_layout.dart';

extension BirthdaySheetX on BuildContext {
  Future<DateTime?> showBirthdaySheetSelector({DateTime? current}) {
    return showAppBottomSheet(
      builder: (context) => BirthdaySheetLayout(current: current),
    );
  }
}
