part of 'app_snackbar.dart';

class _SnackbarHost extends StatefulWidget {
  final String message;
  final SnackbarType type;
  final Duration duration;
  final VoidCallback onDismissed;

  const new({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismissed,
  });

  @override
  State<_SnackbarHost> createState() => __SnackbarHostState();
}

class __SnackbarHostState extends State<_SnackbarHost>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
    reverseDuration: const Duration(milliseconds: 200),
  );

  late final _slide = Tween<Offset>(
    begin: const Offset(0, 0.3),
    end: .zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

  Timer? _timer;
  bool _closing = false;

  String get message => widget.message;
  SnackbarType get type => widget.type;
  Duration get duration => widget.duration;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    _timer = Timer(duration, _dismiss);
  }

  Future<void> _dismiss() async {
    if (_closing) return;
    _closing = true;

    _timer?.cancel();
    if (!mounted) return;

    await _controller.reverse();
    widget.onDismissed();
  }

  @override
  dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;
    final insetsBottom = context.viewInsets.bottom;
    final paddingBottom = context.padding.bottom;

    final (border, foreground) = switch (type) {
      .info => (scheme.info, scheme.onInfo),
      .success => (scheme.success, scheme.onSuccess),
      .warning => (scheme.warning, scheme.onWarning),
      .error => (scheme.error, scheme.onError),
    };

    return Positioned.fill(
      child: ValueListenableBuilder<double>(
        valueListenable: SnackbarInset.bottom,
        builder: (context, bnvHeight, child) {
          final base = bnvHeight > 0 ? bnvHeight : paddingBottom;
          final bottom = math.max(insetsBottom, base) + SpacingSize.lg;

          return AnimatedPadding(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            padding: .fromLTRB(
              SpacingSize.xl,
              0,
              SpacingSize.xl,
              math.max(bottom, 0),
            ),
            child: Align(alignment: .bottomCenter, child: child),
          );
        },

        child: FadeTransition(
          opacity: _controller,
          child: SlideTransition(
            position: _slide,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Material(
                color: scheme.surface,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: .circular(RadiusSize.sm),
                  side: BorderSide(color: border, width: StrokeSize.thin),
                ),
                child: InkWell(
                  onTap: _dismiss,
                  borderRadius: .circular(RadiusSize.sm),
                  child: Padding(
                    padding: const .all(SpacingSize.lg),
                    child: Align(
                      alignment: .centerLeft,
                      heightFactor: 1,
                      child: Text(
                        message,
                        style: textTheme.bodyMedium?.copyWith(
                          color: foreground,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
