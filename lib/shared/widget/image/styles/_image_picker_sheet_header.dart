part of '../extensions/image_x.dart';

class _ImagePickerSheetHeader extends StatelessWidget {
  final VoidCallback? onTapDelete;

  const new({this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;
    return Padding(
      padding: const .only(
        left: SpacingSize.lg,
        right: SpacingSize.lg,
        bottom: SpacingSize.lg,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          AppButton.ghost(
            onPressed: context.pop,
            icon: AppIcon.close,
            iconSize: IconSize.sm,
            foregroundColor: scheme.onBackground,
          ),

          Text(
            'Photo Profile',
            style: textTheme.titleLarge?.copyWith(fontWeight: .w600),
          ),

          AppButton.ghost(
            onPressed: onTapDelete,
            icon: AppIcon.trash,
            iconSize: IconSize.sm,
            foregroundColor: scheme.onBackground,
          ),
        ],
      ),
    );
  }
}
