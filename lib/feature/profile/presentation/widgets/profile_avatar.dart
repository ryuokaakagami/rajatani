import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class ProfileAvatar extends StatelessWidget {
  final VoidCallback? onTapAvatar, onTapBadge;
  final String? imageUrl;
  final double? radius;
  final bool isEditable;
  final Object? heroTag;

  const new({
    super.key,
    this.onTapAvatar,
    this.imageUrl,
    this.radius,
    this.heroTag,
  }) : isEditable = false,
       onTapBadge = null;

  const new editable({
    super.key,
    this.onTapAvatar,
    this.onTapBadge,
    this.imageUrl,
    this.radius,
    this.heroTag,
  }) : isEditable = true;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius =
        radius ?? (isEditable ? AvatarSize.xxl : AvatarSize.xl);
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    final fallbackAvatar = _BaseAvatar(
      onTapAvatar: onTapAvatar,
      onTapBadge: onTapBadge,
      radius: effectiveRadius,
      isEditable: isEditable,
    );

    Widget avatarContent = fallbackAvatar;

    if (hasImage) {
      avatarContent = CachedNetworkImage(
        imageUrl: imageUrl!,
        placeholder: (context, url) => fallbackAvatar,
        errorWidget: (context, url, error) => fallbackAvatar,
        imageBuilder: (context, imageProvider) {
          return _BaseAvatar(
            onTapAvatar: onTapAvatar,
            onTapBadge: onTapBadge,
            image: imageProvider,
            radius: effectiveRadius,
            isEditable: isEditable,
            heroTag: heroTag,
          );
        },
      );
    }

    return avatarContent;
  }
}

class _BaseAvatar extends StatelessWidget {
  final VoidCallback? onTapAvatar, onTapBadge;
  final ImageProvider? image;
  final double? radius;
  final bool isEditable;
  final Object? heroTag;

  const new({
    this.onTapAvatar,
    this.onTapBadge,
    this.image,
    this.radius,
    required this.isEditable,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final hasImage = image != null;

    Widget avatar = CircleAvatar(
      backgroundColor: scheme.surface,
      radius: radius,
      backgroundImage: image,
      child: !hasImage
          ? Icon(
              AppIcon.user,
              size: isEditable ? IconSize.xl : IconSize.lg,
              color: scheme.onSurface,
            )
          : null,
    );

    if (heroTag != null) {
      avatar = Hero(tag: heroTag!, child: avatar);
    }

    avatar = InkWell(
      onTap: onTapAvatar,
      borderRadius: .circular(RadiusSize.max),
      child: avatar,
    );

    if (!isEditable) return avatar;

    return Stack(
      clipBehavior: .none,
      children: [
        avatar,
        Positioned(
          right: -2.5,
          bottom: -2.5,
          child: AppButton.floating(
            onPressed: onTapBadge,
            elevation: .0,
            type: .small,
            icon: AppIcon.camera,
            shape: CircleBorder(),
          ),
        ),
      ],
    );
  }
}
