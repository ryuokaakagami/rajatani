part of 'image_picker_sheet_layout.dart';

class _ImagePickerSheetHeader extends StatelessWidget {
  final VoidCallback? onTapDelete;
  final bool showDelete;

  const new({this.onTapDelete, this.showDelete = true});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        AppButton.ghost(
          onPressed: Navigator.of(context).pop,
          icon: AppIcon.close,
          iconSize: IconSize.sm,
          foregroundColor: scheme.onBackground,
        ),

        Text(
          'Photo Profile',
          style: textTheme.titleLarge?.copyWith(fontWeight: .w600),
        ),

        Visibility(
          visible: showDelete,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: AppButton.ghost(
            onPressed: onTapDelete,
            icon: AppIcon.trash,
            iconSize: IconSize.sm,
            foregroundColor: scheme.onBackground,
          ),
        ),
      ],
    );
  }
}
