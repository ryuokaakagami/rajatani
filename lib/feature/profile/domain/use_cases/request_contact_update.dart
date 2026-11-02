import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../repositories/profile_repository.dart';

class RequestContactChange {
  final ProfileRepository _repository;

  new({required this._repository});

  Future<Either<AppException, Unit>> call({String? email, String? phone}) =>
      _repository.requestContactUpdate(email: email, phone: phone);
}
