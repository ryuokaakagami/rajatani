import 'package:flutter/material.dart';

import '../../../../../core/utils/console.dart';
import '../../../../../shared/constant/constant.dart';
import '../../../../../shared/widget/widget.dart';
import '../../../constants/profile_string.dart';
import '../../widgets/profile_edit_layout.dart';

class ProfileEditBioScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileEditBioScreen> createState() => _ProfileEditBioScreenState();
}

class _ProfileEditBioScreenState extends State<ProfileEditBioScreen> {
  final _controller = TextEditingController();

  void _handleSaved() {
    Console.info(message: _controller.text.trim());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileEditLayout(
      onPressed: _handleSaved,
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
  }
}
