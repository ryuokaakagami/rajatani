import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:croppy/croppy.dart';
import 'package:path_provider/path_provider.dart';

import '../../bottom_sheet/bottom_sheet.dart';
import '../enums/image_picker_type.dart';
import '../styles/image_picker_sheet_layout.dart';

extension ImageX on BuildContext {
  Future<ImagePickerType?> showImagePickerSheet({bool showDelete = true}) {
    return showAppBottomSheet<ImagePickerType>(
      builder: (context) {
        return ImagePickerSheetLayout(showDelete: showDelete);
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
      '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png',
    );

    await tempFile.writeAsBytes(bytes);

    return tempFile.path;
  }
}
