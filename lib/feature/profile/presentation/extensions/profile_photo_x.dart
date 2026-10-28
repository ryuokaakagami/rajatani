import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/service/locator.dart';
import '../../../../core/core.dart';
import '../../../../shared/widget/image/enums/image_picker_type.dart';
import '../../../../shared/widget/image/extensions/image_x.dart';
import '../../../../shared/widget/snackbar/snackbar.dart';
import '../../../feature.dart';

extension ProfilePhotoX on BuildContext {
  Future<void> changePhotoProfile({
    required String userId,
    String? oldPath,
    required bool showDelete,
  }) async {
    final choice = await showImagePickerSheet(showDelete: showDelete);
    if (choice == null || !mounted) return;

    final avatar = read<AvatarCubit>();

    if (choice == .delete) {
      avatar.delete(userId: userId, oldPath: oldPath);
      return;
    }

    final path = await _pickAndCrop(choice);
    if (path == null || !mounted) return;

    avatar.change(userId: userId, path: path, oldPath: oldPath);
  }

  Future<String?> _pickAndCrop(ImagePickerType choice) async {
    final result = await sl<MediaService>().pickImage(
      source: choice == .camera ? .camera : .gallery,
      maxWidth: 512,
      maxHeight: 512,
    );

    final path = result.fold((e) {
      snackBarError(e.message);
      return null;
    }, (path) => path);

    if (path == null || !mounted) return null;
    return cropImage(path: path, isSquare: true);
  }
}
