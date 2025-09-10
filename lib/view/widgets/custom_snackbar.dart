import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';

bool isSnackbarActive = false;
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToast({
  required String message,
  bool isError = true,
  bool isInternet = false,
}) {
  isSnackbarActive = true;
  return ScaffoldMessenger.of(
      navigatorKey.currentContext!,
    ).showSnackBar(_customSnackBar(message, isError, isInternet))
    ..closed.then((value) => isSnackbarActive = false)
    ..setState;
}

SnackBar _customSnackBar(String message, bool isError, bool isInternet) {
  return SnackBar(
    duration: isInternet
        ? (isError ? const Duration(days: 1) : const Duration(seconds: 3))
        : const Duration(seconds: 3),
    dismissDirection: DismissDirection.up,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.zero,
    content: Container(
      decoration: BoxDecoration(
        color: isError ? AppColors.redPrimary : AppColors.greenPrimary,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackSecondary,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(-4, 4),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: message.toText(
            textAlign: TextAlign.start,
            fontSize: 14,
            color: AppColors.whitePrimary,
            fontWeight: AppStyle.w500,
          ),
        ),
      ),
    ),
  );
}
