import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:croppy/croppy.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constant/app_icon.dart';
import '../../../constant/icon_size.dart';
import '../../../constant/spacing_size.dart';
import '../../../theme/app_theme.dart';
import '../../bottom_sheet/sheet_x.dart';
import '../../button/button.dart';
import '../../menu/menu.dart';
import '../enums/image_picker_type.dart';
import 'image_picker_x.dart';

part '../styles/_image_picker_sheet_header.dart';
part '../styles/_image_picker_sheet_item.dart';

extension ImageX on BuildContext {
  Future<ImagePickerType?> showImagePickerSheet() {
    return showAppBottomSheet<ImagePickerType>(
      builder: (context) {
        return [
          _ImagePickerSheetHeader(
            onTapDelete: () {
              context.pop(ImagePickerType.delete);
            },
          ),

          for (final type in ImagePickerType.sources)
            _ImagePickerSheetItem(
              icon: type.icon,
              label: type.title,
              onTap: () => context.pop(type),
            ),
        ];
      },
    );
  }

  Future<String?> cropImage({
    required String path,
    bool isSquare = true,
  }) async {
    final result = await showMaterialImageCropper(
      this,
      imageProvider: FileImage(File(path)),
      allowedAspectRatios: isSquare
          ? [const CropAspectRatio(width: 1, height: 1)]
          : null,
    );

    if (result == null || !mounted) return null;

    final byte = await result.uiImage.toByteData(
      format: ui.ImageByteFormat.png,
    );

    final bytes = byte!.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempFile = File(
      '${tempDir.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.png',
    );

    await tempFile.writeAsBytes(bytes);

    return tempFile.path;
  }
}
