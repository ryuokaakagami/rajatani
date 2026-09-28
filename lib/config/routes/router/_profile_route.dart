part of 'router.dart';

final _profileRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: RoutesConstant.paths.profile,
      name: RoutesConstant.names.profile,
      builder: (context, state) => const Profile(),
    ),
  ],
);

class Profile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton.ghost(
          onPressed: () async {
            await context.dialogDestructive(
              title: 'Sign Out',
              message: 'Are you sure you want to sign out of your account?',
              destructiveText: 'Sign Out',
              onConfirm: context.read<SessionCubit>().signOut,
            );
          },
          icon: Iconsax.user_outline,
          label: 'Profile',
        ),
      ),
    );
  }
}
