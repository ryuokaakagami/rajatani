import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../repositories/profile_repository.dart';

class DeleteAvatar {
  final ProfileRepository _repository;

  const new({required this._repository});

  Future<Either<AppException, Unit>> call({
    required String userId,
    String? oldPath,
  }) async {
    final cleared = await _repository.setAvatar(
      userId: userId,
      url: null,
      path: null,
    );

    if (cleared.isLeft()) return cleared;

    if (oldPath != null && oldPath.isNotEmpty) {
      unawaited(_repository.removeAvatar(path: oldPath));
    }

    return const Right(unit);
  }
}
