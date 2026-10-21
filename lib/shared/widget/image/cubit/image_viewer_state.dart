part of 'image_viewer_cubit.dart';

@freezed
abstract class ImageViewerState with _$ImageViewerState {
  const factory ImageViewerState({
    @Default(.0) double dragOffsetY,
    @Default(false) bool isDragging,
    @Default(false) bool isZoomed,
    @Default(false) bool isDismissed,
  }) = _ImageViewerState;
}
