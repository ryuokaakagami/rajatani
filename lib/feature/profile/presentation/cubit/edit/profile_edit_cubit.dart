import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/profile_update.dart';
import '../../../domain/use_cases/update_data_profile.dart';

part 'profile_edit_state.dart';
part 'profile_edit_cubit.freezed.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  final UpdateDataProfile _updateDataProfile;

  new({required this._updateDataProfile}) : super(ProfileEditState.initial());

  Future<void> update({
    required String userId,
    required ProfileUpdate data,
  }) async {
    emit(ProfileEditState.loading());

    final result = await _updateDataProfile.call(userId: userId, data: data);

    result.fold(
      (e) => emit(ProfileEditState.error(message: e.message)),
      (_) => emit(ProfileEditState.success()),
    );
  }
}
