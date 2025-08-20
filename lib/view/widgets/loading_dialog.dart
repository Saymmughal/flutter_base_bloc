// LOADING DIALOG
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';

loaderDialog() {
  return showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    useSafeArea: false,
    builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(100),
        contentPadding: const EdgeInsets.all(25),
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: SizedBox(
          height: 80.h,
          width: 80.w,
          child: const Center(
            child: CircularProgressIndicator(color: AppColors.azurePrimary),
          ),
        ),
      );
    },
  );
}
