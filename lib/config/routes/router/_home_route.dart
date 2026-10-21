part of 'router.dart';

final _homeRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: RoutesConstant.paths.home,
      name: RoutesConstant.names.home,
      pageBuilder: (context, state) {
        return transitionPage(key: state.pageKey, child: const Home());
      },
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
          onPressed: () async {},
          icon: Iconsax.home_2_outline,
          label: 'Home',
        ),
      ),
    );
  }
}
