import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/user/entities/user_entity.dart';
import '../cubit/user_cubit.dart';

extension UserSelect on BuildContext {
  UserEntity? get userOrNull => select((UserCubit c) => c.state.data);
}
