import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/use_cases/request_contact_update.dart';
import '../../../domain/use_cases/resend_request_contact_update.dart';
import '../../../domain/use_cases/verification_request_contact_update.dart';

part 'contact_update_state.dart';
part 'contact_update_cubit.freezed.dart';

class ContactUpdateCubit extends Cubit<ContactUpdateState> {
  final RequestContactChange _request;
  final VerificationRequestContactChange _verification;
  final ResendRequestContactChange _resend;

  ContactUpdateCubit({
    required this._request,
    required this._verification,
    required this._resend,
  }) : super(ContactUpdateState.initial());

  Future<void> request({required String contact, required bool isPhone}) async {
    emit(ContactUpdateState.loading(action: .request));

    final result = isPhone
        ? await _request.call(phone: contact)
        : await _request.call(email: contact);

    if (isClosed) return;

    result.fold(
      (failure) => emit(ContactUpdateState.error(message: failure.message)),
      (_) => emit(ContactUpdateState.success(action: .request)),
    );
  }

  Future<void> verify({
    required String otp,
    required String contact,
    required bool isPhone,
    bool isFinal = true,
  }) async {
    emit(ContactUpdateState.loading(action: .verify));

    final result = isPhone
        ? await _verification.call(phone: contact, otp: otp)
        : await _verification.call(email: contact, otp: otp);

    if (isClosed) return;

    result.fold(
      (failure) => emit(ContactUpdateState.error(message: failure.message)),
      (isComplete) =>
          _validateVerifyResponse(isComplete: isComplete, isFinal: isFinal),
    );
  }

  Future<void> resend({
    required String contact,
    required bool isPhone,
    bool restart = false,
  }) async {
    final ContactUpdateAction action = restart ? .restart : .resend;
    emit(ContactUpdateState.loading(action: action));

    final result = isPhone
        ? await _resend.call(phone: contact)
        : await _resend.call(email: contact);

    if (isClosed) return;

    result.fold(
      (e) => emit(ContactUpdateState.error(message: e.message)),
      (_) => emit(ContactUpdateState.success(action: action)),
    );
  }

  void _validateVerifyResponse({
    required bool isComplete,
    required bool isFinal,
  }) {
    if (isComplete) {
      emit(ContactUpdateState.success(action: .verify));
    } else {
      if (isFinal) {
        emit(
          ContactUpdateState.error(
            message: 'Code is invalid. Please resend and use the latest codes.',
          ),
        );
        return;
      }

      emit(ContactUpdateState.incomplete());
    }
  }
}
