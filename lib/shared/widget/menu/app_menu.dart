part of 'menu.dart';

class AppMenu extends StatelessWidget {
  final _MenuType _type;
  final VoidCallback? onTap;
  final IconData? icon;
  final String? title, subtitle;
  final Color? iconColor, titleColor, subtitleColor;
  final bool hasArrow;
  final Widget? child;
  final List<Widget>? children;
  final EdgeInsets? boxPadding, itemPadding;
  final BorderRadius? itemRadius;

  const new card({
    super.key,
    this.onTap,
    this.icon,
    this.title,
    this.subtitle,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
    this.boxPadding,
    this.itemPadding,
    this.itemRadius,
  }) : _type = .card,
       hasArrow = false,
       child = null,
       children = null;

  const new cardPlain({
    super.key,
    this.onTap,
    this.icon,
    this.title,
    this.subtitle,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
    this.boxPadding,
    this.itemPadding,
    this.itemRadius,
  }) : _type = .cardPlain,
       hasArrow = true,
       child = null,
       children = null;

  const new item({
    super.key,
    this.onTap,
    this.icon,
    this.title,
    this.subtitle,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
    this.itemPadding,
    this.itemRadius,
  }) : _type = .item,
       hasArrow = false,
       boxPadding = null,
       child = null,
       children = null;

  const new itemPlain({
    super.key,
    this.onTap,
    this.icon,
    this.title,
    this.subtitle,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
    this.itemPadding,
    this.itemRadius,
  }) : _type = .itemPlain,
       hasArrow = true,
       boxPadding = null,
       child = null,
       children = null;

  const new box({super.key, this.boxPadding, this.child, this.children})
    : _type = .box,
      hasArrow = false,
      onTap = null,
      icon = null,
      title = null,
      subtitle = null,
      iconColor = null,
      titleColor = null,
      subtitleColor = null,
      itemPadding = null,
      itemRadius = null;

  @override
  Widget build(BuildContext context) {
    final item = _MenuItem(
      onTap: onTap,
      icon: icon,
      title: title,
      subtitle: subtitle,
      iconColor: iconColor,
      titleColor: titleColor,
      subtitleColor: subtitleColor,
      hasArrow: hasArrow,
      padding: itemPadding,
      radius: itemRadius,
    );

    final full = _BoxMenu(padding: boxPadding, child: item);

    return switch (_type) {
      .item => item,
      .itemPlain => item,
      .box => _BoxMenu(padding: boxPadding, child: child, children: children),
      .cardPlain => full,
      _ => full,
    };
  }
}
