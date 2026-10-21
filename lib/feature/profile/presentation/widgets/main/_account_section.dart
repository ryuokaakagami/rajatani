part of '../../screens/profile_screen.dart';

class _AccountSection extends StatelessWidget {
  final VoidCallback? onTapDetail, onTapDelivery, onTapPrivacy;

  const new({this.onTapDetail, this.onTapDelivery, this.onTapPrivacy});

  @override
  Widget build(BuildContext context) {
    return ProfileSection(
      title: ProfileString.main.accountSection,
      menu: AppMenu.box(
        children: [
          AppMenu.itemPlain(
            onTap: onTapDetail,
            icon: AppIcon.info,
            title: ProfileString.main.detailMenu,
          ),

          AppMenu.itemPlain(
            onTap: onTapDelivery,
            icon: Iconsax.location_outline,
            title: ProfileString.main.addressMenu,
          ),

          AppMenu.itemPlain(
            onTap: onTapPrivacy,
            icon: Iconsax.security_outline,
            title: ProfileString.main.privacyMenu,
          ),
        ],
      ),
    );
  }
}
