import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../../config/service/locator.dart';
import '../../constant/app_string.dart';
import '../../extension/media_query_x.dart';
import '../dialog/dialog.dart';
import '../resend/cubit/resend_timer_cubit.dart';
import '../../constant/icon_asset.dart';
import '../../constant/icon_size.dart';
import '../../constant/spacing_size.dart';
import '../../theme/app_theme.dart';
import '../../validator/app_validator.dart';
import '../button/button.dart';
import '../field/field.dart';
import '../or_divider.dart';
import '../resend/resend_code.dart';

part '_sheet_body.dart';
part 'sheet_x.dart';
part 'verification_sheet_layout.dart';
