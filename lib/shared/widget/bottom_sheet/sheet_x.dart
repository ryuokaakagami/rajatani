part of 'bottom_sheet.dart';

extension SheetX on BuildContext {
  Future<T?> showAppBottomSheet<T>({
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isFullScreen = false,
  }) {
    return _showSheet<T>(
      builder: builder,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isFullScreen: isFullScreen,
    );
  }

  Future<T?> showBlocBottomSheet<T>({
    required List<SingleChildWidget> providers,
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isFullScreen = false,
  }) {
    return _showSheet<T>(
      builder: builder,
      providers: providers,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isFullScreen: isFullScreen,
    );
  }

  Future<bool?> showVerifySheet({
    required WidgetBuilder builder,
    List<SingleChildWidget> providers = const [],
    Widget Function(Widget child)? wrap,
  }) {
    return _showSheet<bool?>(
      builder: builder,
      wrap: wrap,
      providers: [
        BlocProvider(create: (_) => sl<ResendTimerCubit>()),
        ...providers,
      ],
      isDismissible: false,
      enableDrag: false,
    );
  }

  Future<T?> _showSheet<T>({
    required WidgetBuilder builder,
    List<SingleChildWidget> providers = const [],
    Widget Function(Widget child)? wrap,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isFullScreen = false,
  }) {
    final draggable = enableDrag && !isFullScreen;

    return showModalBottomSheet<T>(
      context: this,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: !isFullScreen,
      isDismissible: isDismissible,
      enableDrag: draggable,
      showDragHandle: draggable,
      builder: (_) {
        Widget content = Builder(builder: builder);
        content = wrap?.call(content) ?? content;
        content = isFullScreen
            ? _FullScreenBody(child: content)
            : _SheetBody(child: content);

        if (providers.isEmpty) return content;
        return MultiBlocProvider(providers: providers, child: content);
      },
    );
  }
}
