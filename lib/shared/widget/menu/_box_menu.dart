part of 'menu.dart';

class _BoxMenu extends StatelessWidget {
  final Widget? child;
  final List<Widget>? children;
  final EdgeInsets? padding;

  const new({this.padding, this.child, this.children});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: .circular(RadiusSize.lg),
        border: .all(color: scheme.stroke),
      ),
      padding: padding ?? const .all(SpacingSize.md),
      child:
          child ??
          Column(
            mainAxisSize: .min,
            spacing: SpacingSize.md,
            children: children ?? [],
          ),
    );
  }
}
