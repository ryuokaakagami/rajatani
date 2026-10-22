part of '../../screens/profile_screen.dart';

class _Header extends StatelessWidget {
  final VoidCallback? onTapAvatar;
  final String? imageUrl, fullname, username;
  final Object? heroTag;

  const new({
    this.onTapAvatar,
    this.imageUrl,
    this.fullname,
    this.username,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    final hasName = fullname != null && fullname!.isNotEmpty;
    final hasUsername = username != null && username!.isNotEmpty;

    return Column(
      mainAxisSize: .min,
      spacing: SpacingSize.md,
      children: [
        ProfileAvatar(
          onTapAvatar: onTapAvatar,
          imageUrl: imageUrl,
          heroTag: heroTag,
        ),

        Column(
          children: [
            if (hasName) Text(fullname!, style: textTheme.titleLarge),

            if (hasUsername)
              Text(
                username!.asMention,
                style: textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
