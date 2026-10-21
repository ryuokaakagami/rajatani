part of 'image_viewer.dart';

class ImageViewerView extends StatefulWidget {
  final String? imageUrl;
  final Object? heroTag;
  final PreferredSizeWidget? appBar;

  const new({super.key, this.imageUrl, this.heroTag, this.appBar});

  @override
  State<ImageViewerView> createState() => _ImageViewerViewState();
}

class _ImageViewerViewState extends State<ImageViewerView>
    with SingleTickerProviderStateMixin {
  final _transformCtrl = TransformationController();
  late final AnimationController _zoomAnimationCtrl;
  late final ImageViewerController _imageViewerCtrl;

  ImageViewerCubit get _cubit => context.read<ImageViewerCubit>();

  @override
  initState() {
    super.initState();

    _zoomAnimationCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _imageViewerCtrl = ImageViewerController(
      transformCtrl: _transformCtrl,
      zoomAnimationCtrl: _zoomAnimationCtrl,
      cubit: _cubit,
    );

    _transformCtrl.addListener(_imageViewerCtrl.onTransformChanged);
  }

  @override
  void dispose() {
    _transformCtrl.removeListener(_imageViewerCtrl.onTransformChanged);
    _transformCtrl.dispose();
    _zoomAnimationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.height;
    final scheme = Scheme.dark();
    final textTheme = context.textTheme;

    final image = CachedNetworkImage(
      width: context.width,
      height: context.width,
      fit: BoxFit.cover,
      imageUrl: widget.imageUrl!,
      placeholder: (_, _) => const AppLoading(),
      errorWidget: (_, _, _) => const Icon(Icons.error),
    );

    final fallbackText = Text(
      'No image available',
      style: textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
    );

    Widget child = widget.imageUrl != null ? image : fallbackText;

    if (widget.heroTag != null) {
      child = Hero(tag: widget.heroTag!, child: child);
    }

    return BlocListener<ImageViewerCubit, ImageViewerState>(
      listenWhen: (prev, curr) => !prev.isDismissed && curr.isDismissed,
      listener: (context, _) => context.pop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Listener(
          onPointerDown: _imageViewerCtrl.onPointerDown,
          onPointerUp: _imageViewerCtrl.onPointerUp,
          onPointerCancel: _imageViewerCtrl.onPointerUp,
          onPointerMove: _imageViewerCtrl.onPointerMove,
          child: Stack(
            fit: .expand,
            children: [
              BlocBuilder<ImageViewerCubit, ImageViewerState>(
                buildWhen: (previous, current) {
                  return previous.dragOffsetY != current.dragOffsetY ||
                      previous.isDragging != current.isDragging ||
                      previous.isDismissed != current.isDismissed;
                },
                builder: (context, state) {
                  final progress =
                      (state.dragOffsetY.abs() / (screenHeight * 0.4)).clamp(
                        0.0,
                        1.0,
                      );
                  final opacity = state.isDismissed ? 0.0 : 1.0 - progress;

                  final duration = state.isDragging
                      ? Duration.zero
                      : const Duration(milliseconds: 200);

                  return AnimatedContainer(
                    duration: duration,
                    color: scheme.background.withValues(alpha: opacity),
                  );
                },
              ),

              BlocBuilder<ImageViewerCubit, ImageViewerState>(
                buildWhen: (previous, current) {
                  return previous.dragOffsetY != current.dragOffsetY ||
                      previous.isDragging != current.isDragging;
                },
                builder: (context, state) {
                  final duration = state.isDragging
                      ? Duration.zero
                      : const Duration(milliseconds: 200);

                  return AnimatedContainer(
                    duration: duration,
                    transform: Matrix4.translationValues(
                      0,
                      state.dragOffsetY,
                      0,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        _imageViewerCtrl.viewportSize = constraints.biggest;

                        return GestureDetector(
                          onDoubleTapDown: (d) =>
                              _imageViewerCtrl.doubleTapPosition =
                                  d.localPosition,
                          onDoubleTap: _imageViewerCtrl.onDoubleTap,
                          child:
                              BlocSelector<
                                ImageViewerCubit,
                                ImageViewerState,
                                bool
                              >(
                                selector: (state) => state.isZoomed,
                                builder: (context, isZoomed) {
                                  return InteractiveViewer(
                                    transformationController: _transformCtrl,
                                    minScale: 1.0,
                                    maxScale: 4.0,
                                    panEnabled: isZoomed,
                                    boundaryMargin: const .all(double.infinity),
                                    child: Center(child: child),
                                  );
                                },
                              ),
                        );
                      },
                    ),
                  );
                },
              ),

              if (widget.appBar != null)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child:
                      BlocSelector<ImageViewerCubit, ImageViewerState, double>(
                        selector: (state) {
                          if (state.isDismissed) return 0.0;
                          return 1.0 -
                              (state.dragOffsetY.abs() / (screenHeight * 0.4))
                                  .clamp(0.0, 1.0);
                        },
                        builder: (context, opacity) =>
                            Opacity(opacity: opacity, child: widget.appBar),
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
