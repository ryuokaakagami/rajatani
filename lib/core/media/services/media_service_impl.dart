import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../error/app_exception.dart';
import '../../utils/safe_call.dart';
import 'media_service.dart';

class MediaServiceImpl with SafeCall implements MediaService {
  final ImagePicker _picker;

  const new({required this._picker});

  @override
  Future<Either<AppException, String?>> pickImage({
    ImageSource? source,
    int? quality,
    double? maxWidth,
    double? maxHeight,
  }) {
    return call(
      doAction: () async {
        final XFile? image = await _picker.pickImage(
          source: source ?? .gallery,
          imageQuality: quality,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        );

        return image?.path;
      },
    );
  }

  @override
  Future<Either<AppException, List<String?>>> pickImages({
    int? limit,
    int? quality,
    double? maxWidth,
    double? maxHeight,
  }) {
    return call(
      doAction: () async {
        final List<XFile?> images = await _picker.pickMultiImage(
          limit: limit,
          imageQuality: quality,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        );

        return images.map((image) => image?.path).toList();
      },
    );
  }

  @override
  Future<Either<AppException, String>> convertToWebp({
    required String path,
    int quality = 80,
  }) {
    return call(
      doAction: () async {
        final dir = await getTemporaryDirectory();
        final target =
            '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.webp';

        final file = await FlutterImageCompress.compressAndGetFile(
          path,
          target,
          format: .webp,
          quality: quality,
        );

        if (file == null) throw const ImageConversionException();

        return file.path;
      },
    );
  }

  @override
  Future<void> deleteFile(String path) async {
    try {
      await File(path).delete();
    } catch (_) {}
  }
}
