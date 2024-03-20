import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';

extension StringExtension on String {
  Widget toText(
          {Color? color,
          double? fontSize,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          String? fontFamily,
          FontWeight? fontWeight,
          Color? backgroundColor,
          double? lineHeight,
          bool? isBold,
          bool? isMedium}) =>
      Text(
        this,
        maxLines: maxLine ?? maxLine,
        textAlign: textAlign ?? textAlign,
        style: TextStyle(
          height: lineHeight,
          backgroundColor: backgroundColor ?? backgroundColor,
          color: color ?? Colors.black,
          fontSize: (fontSize ?? 12).toInt().h,
          fontFamily: fontFamily ?? poppinsRegular,
          fontStyle: FontStyle.normal,
          overflow: overflow ?? TextOverflow.ellipsis,
          fontWeight: fontWeight ??
              (isBold == true
                  ? FontWeight.bold
                  : (isMedium == true ? FontWeight.w500 : FontWeight.w400)),
        ),
      );
}
