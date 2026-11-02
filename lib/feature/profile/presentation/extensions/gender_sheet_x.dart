import 'package:flutter/material.dart';

import '../../../../core/domain/user/enums/gender.dart';
import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../../../shared/widget/widget.dart';
import 'gender_x.dart';
part '../widgets/_gender_sheet_layout.dart';

extension GenderSheetX on BuildContext {
  Future<({Gender? value})?> showGenderSheetSelector({Gender? current}) {
    return showAppBottomSheet<({Gender? value})>(
      builder: (context) => _GenderSheetLayout(current: current),
    );
  }
}
