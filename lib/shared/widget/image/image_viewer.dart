import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extension/media_query_x.dart';
import '../../theme/app_theme.dart';
import '../../theme/colors/scheme.dart';
import '../app_loading.dart';
import 'controller/image_viewer_controller.dart';
import 'cubit/image_viewer_cubit.dart';

part 'image_viewer_view.dart';

class ImageViewer extends StatelessWidget {
  final String? imageUrl;
  final Object? heroTag;
  final PreferredSizeWidget? appBar;

  const new({super.key, this.imageUrl, this.heroTag, this.appBar});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => ImageViewerCubit(),
    child: ImageViewerView(
      imageUrl: imageUrl,
      heroTag: heroTag,
      appBar: appBar,
    ),
  );
}
