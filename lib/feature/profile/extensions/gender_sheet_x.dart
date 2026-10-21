import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constant/spacing_size.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widget/bottom_sheet/sheet_x.dart';
import '../data/enum/gender.dart';
import 'gender_x.dart';

extension GenderSheetX on BuildContext {
  Future<({Gender? value})?> showGenderSheetSelector({Gender? current}) {
    return showAppBottomSheet<({Gender? value})>(
      builder: (context) => [
        Align(
          alignment: .topCenter,
          child: Column(
            mainAxisSize: .min,
            spacing: SpacingSize.sm,
            children: [
              Text(
                'Select one',
                style: textTheme.bodyLarge?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),

              FractionallySizedBox(
                widthFactor: .3,
                child: Divider(color: scheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
        RadioGroup<Gender>(
          groupValue: current,
          onChanged: (g) => context.pop((value: g)),
          child: Column(
            mainAxisSize: .min,
            children: [
              for (final gender in Gender.values)
                RadioListTile<Gender>(
                  value: gender,
                  toggleable: true,
                  controlAffinity: .trailing,
                  secondary: Icon(gender.icon, color: gender.color),
                  title: Text(gender.label),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
