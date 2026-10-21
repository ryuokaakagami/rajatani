import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_viewer_state.dart';
part 'image_viewer_cubit.freezed.dart';

class ImageViewerCubit extends Cubit<ImageViewerState> {
  new() : super(ImageViewerState());

  void updateDrag(double deltaY) {
    if (state.isZoomed || state.isDismissed) return;
    emit(
      state.copyWith(dragOffsetY: state.dragOffsetY + deltaY, isDragging: true),
    );
  }

  void endDrag({required double threshold, required bool hadMultiTouch}) {
    final shouldDismiss = !hadMultiTouch && state.dragOffsetY.abs() > threshold;

    if (shouldDismiss) {
      emit(state.copyWith(isDismissed: true, isDragging: false));
    } else {
      resetDrag();
    }
  }

  void resetDrag() => emit(state.copyWith(isDragging: false, dragOffsetY: 0));

  void setZoomed(bool isZoomed) {
    if (state.isZoomed != isZoomed) {
      emit(state.copyWith(isZoomed: isZoomed));
    }
  }
}
