import 'package:dartz/dartz.dart';

import '../../../../core/error/app_exception.dart';
import '../repositories/profile_repository.dart';

class VerificationRequestContactChange {
  final ProfileRepository _repository;

  new({required this._repository});

  Future<Either<AppException, bool>> call({
    required String otp,
    String? email,
    String? phone,
  }) => _repository.verifyContactUpdate(otp: otp, email: email, phone: phone);
}
