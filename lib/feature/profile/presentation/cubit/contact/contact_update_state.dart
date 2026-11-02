part of 'contact_update_cubit.dart';

enum ContactUpdateAction { request, verify, resend, restart }

@freezed
class ContactUpdateState with _$ContactUpdateState {
  const new _();

  const factory ContactUpdateState.initial() = _Initial;

  const factory ContactUpdateState.loading({
    required ContactUpdateAction action,
  }) = _Loading;

  const factory ContactUpdateState.incomplete() = _Incomplete;

  const factory ContactUpdateState.success({
    required ContactUpdateAction action,
  }) = _Success;

  const factory ContactUpdateState.error({required String message}) = _Error;

  bool get isIncomplete {
    return maybeWhen(incomplete: () => true, orElse: () => false);
  }

  bool get isLoading => maybeWhen(loading: (_) => true, orElse: () => false);

  bool get isRestarted {
    return maybeWhen(
      success: (action) => action == .restart,
      orElse: () => false,
    );
  }

  bool get isRequestLoading {
    return maybeWhen(
      loading: (action) => action == .request,
      orElse: () => false,
    );
  }

  bool get isVerifyLoading {
    return maybeWhen(
      loading: (action) => action == .verify,
      orElse: () => false,
    );
  }

  bool get isResendLoading {
    return maybeWhen(
      loading: (action) => action == .resend || action == .restart,
      orElse: () => false,
    );
  }
}
