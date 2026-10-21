part of '../../screens/profile_screen.dart';

class _TransactionSection extends StatelessWidget {
  final VoidCallback? onTapOrder;

  const new({this.onTapOrder});

  @override
  Widget build(BuildContext context) {
    return ProfileSection(
      title: ProfileString.main.transactionSection,
      menu: AppMenu.cardPlain(
        onTap: onTapOrder,
        icon: Iconsax.receipt_1_outline,
        title: ProfileString.main.orderMenu,
      ),
    );
  }
}
