import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

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
}
