part of 'router.dart';

final _ordersRoute = StatefulShellBranch(
  routes: [
    GoRoute(
      path: RoutesConstant.paths.orders,
      name: RoutesConstant.names.orders,
      builder: (context, state) => const Orders(),
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
          onPressed: () async {
            await context.dialogDestructive(
              title: 'Sign Out',
              message: 'Are you sure you want to sign out of your account?',
              destructiveText: 'Sign Out',
              onConfirm: context.read<SessionCubit>().signOut,
            );
          },
          icon: Iconsax.receipt_2_1_outline,
          label: 'Orders',
        ),
      ),
    );
  }
}
