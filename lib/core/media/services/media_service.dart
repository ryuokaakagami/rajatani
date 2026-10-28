import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../core.dart';

abstract class MediaService {
  Future<Either<AppException, String?>> pickImage({
    ImageSource? source,
    int? quality,
    double? maxWidth,
    double? maxHeight,
  });

  Future<Either<AppException, List<String?>>> pickImages({
    int? limit,
    int? quality,
    double? maxWidth,
    double? maxHeight,
  });

  Future<Either<AppException, String>> convertToWebp({
    required String path,
    int quality = 80,
  });

  Future<void> deleteFile(String path);
}
