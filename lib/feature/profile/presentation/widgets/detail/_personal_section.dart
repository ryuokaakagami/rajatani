part of '../../screens/profile_detail_screen.dart';

class _PersonalSection extends StatelessWidget {
  final VoidCallback? onTapFullname,
      onTapUsername,
      onTapBio,
      onTapGender,
      onTapBirthday;
  final String? fullname, username, bio, gender;
  final DateTime? birthday;

  const new({
    this.onTapFullname,
    this.onTapUsername,
    this.onTapBio,
    this.onTapGender,
    this.onTapBirthday,
    this.fullname,
    this.username,
    this.bio,
    this.gender,
    this.birthday,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return ProfileSection(
      title: ProfileString.detail.personalSection,
      menu: AppMenu.box(
        children: [
          AppMenu.item(
            onTap: onTapFullname,
            icon: Iconsax.user_outline,
            iconColor: scheme.onInfo,
            title: ProfileString.detail.nameMenu,
            subtitle: fullname.orFallback(),
          ),

          AppMenu.item(
            onTap: onTapUsername,
            icon: AppIcon.mention,
            iconColor: scheme.onError,
            title: ProfileString.detail.usernameMenu,
            subtitle: username.orFallback(),
          ),

          AppMenu.item(
            onTap: onTapBio,
            icon: AppIcon.info,
            iconColor: scheme.onSuccess,
            title: ProfileString.detail.bioMenu,
            subtitle: bio.orFallback(),
          ),

          AppMenu.item(
            onTap: onTapGender,
            icon: AppIcon.gender,
            iconColor: Colors.pink,
            title: ProfileString.detail.genderMenu,
            subtitle: gender.orFallback(),
          ),

          AppMenu.item(
            onTap: onTapBirthday,
            icon: AppIcon.calendar,
            iconColor: scheme.primary,
            title: ProfileString.detail.birthdayMenu,
            subtitle: (birthday?.toFormat).orFallback(),
          ),
        ],
      ),
    );
  }
}
