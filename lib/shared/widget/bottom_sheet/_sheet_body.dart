part of 'bottom_sheet.dart';

class _SheetBody extends StatelessWidget {
  final Widget child;

  const new({required this.child});

  @override
  Widget build(BuildContext context) {
    final insetsBottom = context.viewInsets.bottom;
    final paddingBottom = context.padding.bottom;

    return Padding(
      padding: .only(bottom: math.max(insetsBottom, paddingBottom)),
      child: SingleChildScrollView(
        keyboardDismissBehavior: .onDrag,
        child: child,
      ),
    );
  }
}

class _FullScreenBody extends StatelessWidget {
  final Widget child;

  const new({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            keyboardDismissBehavior: .onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
