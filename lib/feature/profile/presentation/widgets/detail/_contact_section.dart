part of '../../screens/profile_detail_screen.dart';

class _ContactSection extends StatelessWidget {
  final VoidCallback? onTapEmail, onTapPhone;
  final String? email, phone;

  const new({this.onTapEmail, this.onTapPhone, this.email, this.phone});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return ProfileSection(
      title: ProfileString.detail.contactSection,
      menu: AppMenu.box(
        children: [
          AppMenu.item(
            onTap: onTapEmail,
            icon: AppIcon.email,
            iconColor: scheme.onError,
            title: AppString.emailLabel,
            subtitle: email.orFallback(),
          ),

          AppMenu.item(
            onTap: onTapPhone,
            icon: AppIcon.phone,
            iconColor: scheme.onSuccess,
            title: AppString.phoneLabel,
            subtitle: phone.orFallback(),
          ),
        ],
      ),
    );
  }
}
