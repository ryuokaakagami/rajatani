part of 'router.dart';

final _ordersRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: RoutesConstant.paths.orders,
      name: RoutesConstant.names.orders,
      pageBuilder: (context, state) {
        return transitionPage(key: state.pageKey, child: const Orders());
      },
    ),
  ],
);

class Orders extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton.ghost(
          onPressed: () async {},
          icon: Iconsax.receipt_2_1_outline,
          label: 'Orders',
        ),
      ),
    );
  }
}
