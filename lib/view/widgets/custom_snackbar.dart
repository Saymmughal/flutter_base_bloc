import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter_base_bloc/utils/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToast(
    {required String message, required bool isError}) {
  return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      _customSnackBar(navigatorKey.currentContext!, message, isError));
}

SnackBar _customSnackBar(BuildContext context, String message, bool isError) {
  return SnackBar(
    duration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.up,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.zero,
    content: Container(
      decoration: BoxDecoration(
          color: isError ? greenPrimary : redSecondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: greyLight,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(-4, 4),
            ),
          ]),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: message.toText(
              textAlign: TextAlign.start,
              fontSize: 14,
              color: whitePrimary,
              fontFamily: poppinsMedium),
        ),
      ),
    ),
  );
}
