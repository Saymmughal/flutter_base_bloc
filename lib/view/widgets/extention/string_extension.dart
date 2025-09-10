import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/utils/font_scaling_manager.dart';

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
    maxLines: maxLine,
    textAlign: textAlign,
    style: TextStyle(
      height: lineHeight,
      backgroundColor: backgroundColor,
      color: color,
      fontSize: FontScalingManager.instance.getScaledFontSize(fontSize ?? 12),
      overflow: overflow ?? TextOverflow.ellipsis,
      fontWeight: fontWeight ?? AppStyle.w400, // By Default Regular Font
    ),
  );
}
