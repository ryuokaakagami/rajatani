part of 'image_picker_sheet_layout.dart';

class _ImagePickerSheetItem extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String label;

  const new({this.onTap, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppMenu.item(
      onTap: onTap,
      icon: icon,
      itemPadding: .symmetric(vertical: SpacingSize.lg),
      itemRadius: .zero,
      titleColor: context.scheme.onBackground,
      title: label,
    );
  }
}
