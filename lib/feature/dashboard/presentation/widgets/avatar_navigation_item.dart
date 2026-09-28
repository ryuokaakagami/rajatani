import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../../../shared/constant/icon_size.dart';

class AvatarNavigationItem extends StatelessWidget {
  final String? avatarUrl;
  final bool isSelected;

  const new({super.key, this.avatarUrl, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final icon = isSelected
        ? Icon(Iconsax.user_octagon_bold)
        : Icon(Iconsax.user_octagon_outline);

    if (avatarUrl == null || avatarUrl!.isEmpty) return icon;

    return CachedNetworkImage(
      imageUrl: avatarUrl!,
      placeholder: (context, url) => icon,
      errorWidget: (context, url, error) => icon,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: IconSize.xs,
          backgroundImage: imageProvider,
        );
      },
    );
  }
}
