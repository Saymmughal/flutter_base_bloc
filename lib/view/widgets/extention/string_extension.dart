import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';

extension StringExtension on String {
  Widget toText({
    Color? color,
    double? fontSize,
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    Color? backgroundColor,
    double? lineHeight,
  }) => Text(
    this,
    maxLines: maxLine ?? maxLine,
    textAlign: textAlign ?? textAlign,
    style: TextStyle(
      height: lineHeight,
      backgroundColor: backgroundColor ?? backgroundColor,
      color: color,
      fontSize: (fontSize ?? 12).toInt().h,
      fontFamily: AppStyle.poppins,
      fontStyle: FontStyle.normal,
      overflow: overflow ?? TextOverflow.ellipsis,
      fontWeight: fontWeight ?? AppStyle.w400, // By Default Regular Font
    ),
  );
}
