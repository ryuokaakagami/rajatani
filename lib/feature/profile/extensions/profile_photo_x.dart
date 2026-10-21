import 'package:flutter/material.dart';

import '../../../config/service/locator.dart';
import '../../../core/core.dart';
import '../../../shared/widget/image/extensions/image_x.dart';
import '../../../shared/widget/snackbar/snackbar.dart';

extension ProfilePhotoX on BuildContext {
  Future<String?> pickPhotoProfile() async {
    final choice = await showImagePickerSheet();

    if (choice == null || !mounted) return null;

    if (choice == .delete) return null;

    final service = sl<MediaService>();

    final result = await service.pickImage(
      source: choice == .camera ? .camera : .gallery,
      quality: 50,
      maxWidth: 512,
      maxHeight: 512,
    );

    final path = result.fold((e) {
      snackBarError(e.message);
    }, (path) => path);

    if (path == null || !mounted) return null;

    return cropImage(path: path, isSquare: true);
  }
}
