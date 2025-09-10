import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';

Widget annotatedRegionWidget({
  required Widget child,
  required BuildContext context,
  SystemUiOverlayStyle? systemUiOverlayStyle,
}) => AnnotatedRegion<SystemUiOverlayStyle>(
  value: systemUiOverlayStyle ?? AppColors.systemUiOverlayStyle(context),
  child: child,
);
