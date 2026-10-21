import 'package:flutter/material.dart';

import '../../../constant/app_icon.dart';
import '../enums/image_picker_type.dart';

extension ImagePickerX on ImagePickerType {
  IconData get icon => switch (this) {
    .gallery => AppIcon.gallery,
    _ => AppIcon.camera,
  };
}
