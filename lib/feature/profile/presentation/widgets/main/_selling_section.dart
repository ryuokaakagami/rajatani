part of '../../screens/profile_screen.dart';

class _SellingSection extends StatelessWidget {
  final VoidCallback? onTapCreateStore;

  const new({this.onTapCreateStore});

  @override
  Widget build(BuildContext context) {
    return ProfileSection(
      title: ProfileString.main.sellingSection,
      menu: CardCreateStore(onPressed: onTapCreateStore),
    );
  }
}
