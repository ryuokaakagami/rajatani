import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/user/entities/user_entity.dart';
import '../../../../../shared/shared.dart';
import '../../../constants/profile_string.dart';
import '../../../data/models/profile_update.dart';
import '../../extensions/profile_edit_x.dart';
import '../../cubit/edit/profile_edit_cubit.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditBioScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditBioScreen> createState() => _ProfileEditBioScreenState();
}

class _ProfileEditBioScreenState extends State<ProfileEditBioScreen> {
  late final UserEntity _user = context.read<UserCubit>().state.data!;
  String get _id => _user.id;
  String? get _bio => _user.bio;

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _bio);
  }

  void _handleSaved() {
    final bio = _controller.text.toCleanSpace;
    final isChanged = _bio?.toCleanSpace != bio;

    final cubit = context.read<ProfileEditCubit>();
    if (isChanged) {
      final newData = ProfileUpdate(bio: bio);
      cubit.update(userId: _id, data: newData);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        context.handleProfileEditState(state: state, userId: _id);
      },
      builder: (context, state) {
        return ProfileEditLayout(
          onPressed: _handleSaved,
          isLoading: state.isLoading,
          field: AppField(
            onSubmitted: (_) => _handleSaved(),
            controller: _controller,
            prefixIcon: Icon(AppIcon.info),
            hintText: ProfileString.edit.bioHint,
            maxLines: 5,
            minLines: 1,
            maxLength: 250,
          ),
          title: ProfileString.detail.bioMenu,
          textInfo: ProfileString.edit.bioHelper,
        );
      },
    );
  }
}
