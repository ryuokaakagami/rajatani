import 'package:flutter/material.dart';

import '../../../constant/app_icon.dart';
import '../../../constant/icon_size.dart';
import '../../../constant/spacing_size.dart';
import '../../../theme/app_theme.dart';
import '../../button/button.dart';
import '../../menu/menu.dart';
import '../enums/image_picker_type.dart';
import '../extensions/image_picker_x.dart';

part '../styles/_image_picker_sheet_header.dart';
part '../styles/_image_picker_sheet_item.dart';

class ImagePickerSheetLayout extends StatelessWidget {
  final bool showDelete;

  const new({super.key, required this.showDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: SpacingSize.xl),
      child: Column(
        mainAxisSize: .min,
        spacing: SpacingSize.lg,
        children: [
          _ImagePickerSheetHeader(
            showDelete: showDelete,
            onTapDelete: () {
              Navigator.of(context).pop(ImagePickerType.delete);
            },
          ),

          for (final type in ImagePickerType.sources)
            _ImagePickerSheetItem(
              icon: type.icon,
              label: type.title,
              onTap: () => Navigator.of(context).pop(type),
            ),
        ],
      ),
    );
  }
}
