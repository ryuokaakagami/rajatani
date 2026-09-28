part of 'router.dart';

final _homeRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: RoutesConstant.paths.home,
      name: RoutesConstant.names.home,
      builder: (context, state) => const Home(),
    ),
  ],
);

class Home extends StatelessWidget {
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
          icon: Iconsax.logout_1_outline,
          label: 'Sign out',
        ),
      ),
    );
  }
}
