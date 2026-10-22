part of '../../screens/profile_detail_screen.dart';

class _Header extends StatelessWidget {
  final VoidCallback? onTapAvatar, onTapBadge;
  final String? imageUrl;
  final Object? heroTag;
  final double? rating;
  final int? totalReview;

  const new({
    this.onTapAvatar,
    this.onTapBadge,
    this.imageUrl,
    this.heroTag,
    this.rating,
    this.totalReview,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return Column(
      mainAxisSize: .min,
      spacing: SpacingSize.md,
      children: [
        ProfileAvatar.editable(
          onTapAvatar: onTapAvatar,
          onTapBadge: onTapBadge,
          imageUrl: imageUrl,
          heroTag: heroTag,
        ),

        if (!hasImage)
          Text(
            ProfileString.detail.headerDesc,
            style: textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
            textAlign: .center,
          ),

        Row(
          spacing: SpacingSize.sm,
          mainAxisSize: .min,
          children: [
            Icon(AppIcon.ratingBold, color: scheme.primary),
            Text(
              rating.toString(),
              style: textTheme.bodyMedium?.copyWith(fontWeight: .w600),
            ),

            SizedBox(
              height: IconSize.xs,
              child: VerticalDivider(color: scheme.onSurfaceVariant),
            ),

            Icon(AppIcon.reviewer, color: scheme.info),
            Text(
              (totalReview ?? 0).toCompact,
              style: textTheme.bodyMedium?.copyWith(fontWeight: .w600),
            ),
          ],
        ),
      ],
    );
  }
}
