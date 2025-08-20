import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/svg_image.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/prrimary_button.dart';
import '../../utils/app_styles/style.dart';
import '../../main.dart';
import '../../utils/app_styles/colors.dart';
import '../../utils/app_assets.dart';

void showMessageDialog({
  required String message,
  bool isError = true,
  VoidCallback? onTap,
}) {
  showDialog(
    barrierDismissible: false,
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 0.0,
        backgroundColor: AppColors.whitePrimary,
        child: contentBox(context, isError, message, onTap),
      );
    },
  );
}

Widget contentBox(
  BuildContext context,
  bool isError,
  String message,
  VoidCallback? onTap,
) {
  return Container(
    width: 300.w,
    margin: EdgeInsets.all(20.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // 20.height,
        svgAssetImage(
          isError ? AppIcons.iconError : AppIcons.iconSuccess,
          height: 90.h,
          width: 90.h,
        ),
        20.height,
        Flexible(
          child: message.toText(
            textAlign: TextAlign.center,
            color: AppColors.blackPrimary,
            fontSize: 16,
            fontWeight: AppStyle.w600,
          ),
        ),
        20.height,
        PrimaryButton(
          width: 171.w,
          height: 55.h,
          buttonName: onTap == null ? AppStrings.goBack : AppStrings.tryAgain,
          onPressed: onTap ?? () => goBack(),
        ),
      ],
    ),
  );
}
