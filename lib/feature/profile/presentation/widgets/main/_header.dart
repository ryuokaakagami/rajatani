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

    final displayFullname = hasName ? fullname! : 'User';
    final displayUsername = (hasUsername ? username! : 'user').asMention;

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
            Text(displayFullname, style: textTheme.titleLarge),

            Text(
              displayUsername,
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
