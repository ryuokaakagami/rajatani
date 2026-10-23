import 'package:flutter/material.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../../core/domain/user/enums/gender.dart';
import '../../../shared/shared.dart';

extension GenderX on Gender {
  IconData get icon => switch (this) {
    .male => IonIcons.male,
    .female => IonIcons.female,
    .notToSay => AppIcon.gender,
  };

  Color get color => switch (this) {
    .male => Colors.blue,
    .female => Colors.pink,
    .notToSay => Colors.purple,
  };
}
