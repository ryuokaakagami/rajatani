part of '../../screens/profile_screen.dart';

class _HelpSection extends StatelessWidget {
  final VoidCallback? onTapService, onTapSetting, onTapLogOut;

  const new({this.onTapService, this.onTapSetting, this.onTapLogOut});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return ProfileSection(
      title: ProfileString.main.helpSection,
      menu: AppMenu.box(
        children: [
          AppMenu.itemPlain(
            onTap: onTapService,
            icon: Iconsax.headphone_outline,
            title: ProfileString.main.serviceMenu,
          ),

          AppMenu.itemPlain(
            onTap: onTapSetting,
            icon: Iconsax.setting_2_outline,
            title: ProfileString.main.settingMenu,
          ),

          AppMenu.item(
            onTap: onTapLogOut,
            icon: Iconsax.logout_1_outline,
            title: ProfileString.main.logoutMenu,
            iconColor: scheme.onError,
            titleColor: scheme.onError,
          ),
        ],
      ),
    );
  }
}
