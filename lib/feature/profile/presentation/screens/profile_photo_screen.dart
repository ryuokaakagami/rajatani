import 'package:flutter/material.dart';

import '../../../../core/utils/console.dart';
import '../../../../shared/constant/icon_size.dart';
import '../../../../shared/constant/spacing_size.dart';
import '../../../../shared/theme/colors/scheme.dart';
import '../../../../shared/widget/button/button.dart';
import '../../../../shared/widget/image/image_viewer.dart';
import '../../extensions/profile_photo_x.dart';

class ProfilePhotoScreen extends StatelessWidget {
  final String? id, avatarUrl;

  const new({super.key, this.id, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final scheme = Scheme.dark();

    return ImageViewer(
      imageUrl: avatarUrl,
      heroTag: id,
      appBar: AppBar(
        foregroundColor: scheme.onBackground,
        backgroundColor: Colors.transparent,
        title: const Text('Photo profile'),
        actions: [
          AppButton.ghost(
            onPressed: () async {
              final path = await context.pickPhotoProfile();
              if (path == null || !context.mounted) return;
              Console.info(message: path);
            },
            icon: Icons.edit,
            iconSize: IconSize.sm,
            foregroundColor: scheme.onBackground,
          ),
          const SizedBox(width: SpacingSize.lg),
          AppButton.ghost(
            onPressed: () {},
            icon: Icons.share,
            iconSize: IconSize.sm,
            foregroundColor: scheme.onBackground,
          ),
        ],
      ),
    );
  }
}
