import 'package:flutter/material.dart';

import '../cubit/image_viewer_cubit.dart';

class ImageViewerController {
  final TransformationController transformCtrl;
  final AnimationController zoomAnimationCtrl;
  final ImageViewerCubit cubit;
  Animation<Matrix4>? zoomAnimation;

  new({
    required this.transformCtrl,
    required this.zoomAnimationCtrl,
    required this.cubit,
  }) {
    zoomAnimationCtrl.addListener(() {
      final animation = zoomAnimation;
      if (animation != null) {
        transformCtrl.value = animation.value;
      }
    });
  }

  static const dismissThreshold = 120.0;
  static const doubleTapScale = 2.5;

  int activePointers = 0;
  bool hadMultiTouch = false;
  bool isApplyingClamp = false;
  Size viewportSize = .zero;
  Offset doubleTapPosition = .zero;

  void onTransformChanged() {
    if (isApplyingClamp) return;

    final matrix = transformCtrl.value;
    final scale = matrix.getMaxScaleOnAxis();
    final translation = matrix.getTranslation();

    final currentX = translation.x;
    final currentY = translation.y;

    cubit.setZoomed(scale > 1.01);

    if (viewportSize.isEmpty) return;

    final imgSize = viewportSize.width;
    final imgTop = (viewportSize.height - imgSize) / 2;

    final tx = clampAxis(currentX, scale, 0, imgSize, viewportSize.width);
    final ty = clampAxis(
      currentY,
      scale,
      imgTop,
      imgTop + imgSize,
      viewportSize.height,
    );

    if ((tx - currentX).abs() > 0.01 || (ty - currentY).abs() > 0.01) {
      isApplyingClamp = true;
      transformCtrl.value = matrix.clone()..setTranslationRaw(tx, ty, 0);
      isApplyingClamp = false;
    }
  }

  double clampAxis(
    double current,
    double scale,
    double min,
    double max,
    double viewport,
  ) {
    final length = (max - min) * scale;
    if (length <= viewport) return (viewport - length) / 2 - min * scale;
    return current.clamp(viewport - (scale * max), -(scale * min));
  }

  void onDoubleTap() {
    final begin = transformCtrl.value;
    Matrix4 end;

    if (begin.getMaxScaleOnAxis() > 1.01) {
      end = Matrix4.identity();
    } else {
      final position = doubleTapPosition;
      end = Matrix4.diagonal3Values(doubleTapScale, doubleTapScale, 1.0)
        ..setTranslationRaw(
          -position.dx * (doubleTapScale - 1),
          -position.dy * (doubleTapScale - 1),
          0,
        );
    }

    zoomAnimation = Matrix4Tween(begin: begin, end: end).animate(
      CurvedAnimation(parent: zoomAnimationCtrl, curve: Curves.easeInOut),
    );

    zoomAnimationCtrl
      ..reset()
      ..forward();
  }

  void onPointerDown(PointerDownEvent event) {
    activePointers++;
    if (activePointers > 1) {
      hadMultiTouch = true;
      cubit.resetDrag();
    }
  }

  void onPointerMove(PointerMoveEvent event) {
    if (hadMultiTouch || activePointers != 1) return;
    cubit.updateDrag(event.delta.dy);
  }

  void onPointerUp(PointerEvent event) {
    activePointers = (activePointers - 1).clamp(0, 10);
    if (activePointers > 0) return;

    hadMultiTouch = false;

    cubit.endDrag(threshold: dismissThreshold, hadMultiTouch: hadMultiTouch);
  }
}
