import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/utils/style.dart';

extension StringExtension on String {
  Widget _toText(
          {Color? color,
          double? fontSize,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          FontWeight? fontWeight,
          Color? backgroundColor,
          double? lineHeight}) =>
      Text(
        this,
        maxLines: maxLine,
        textAlign: textAlign,
        style: TextStyle(
          height: lineHeight,
          backgroundColor: backgroundColor,
          color: color ?? Colors.black,
          fontSize: (fontSize ?? 12).toInt().fsp(),
          fontFamily: poppins,
          fontStyle: FontStyle.normal,
          overflow: overflow ?? TextOverflow.ellipsis,
          fontWeight: fontWeight,
        ),
      );

  // Text Widget with default font size 12
  Widget to12W400Text(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.w400,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  Widget to12W500Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );
  Widget to12W600Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  // Text Widget with default font size 14
  Widget to14W400Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  Widget to14W500Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );
  Widget to14W600Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  // Text Widget with default font size 16
  Widget to16W400Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  Widget to16W500Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );
  Widget to16W600Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  // Text Widget with default font size 18
  Widget to18W400Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  Widget to18W500Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );
  Widget to18W600Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  // Text Widget with default font size 20
  Widget to20W400Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  Widget to20W500Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );
  Widget to20W600Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  // Text Widget with default font size 22
  Widget to22W400Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  Widget to22W500Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );
  Widget to22W600Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  // Text Widget with default font size 24
  Widget to24W400Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );

  Widget to24W500Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );
  Widget to24W600Text(
          {Color? color,
          int? maxLine,
          TextAlign? textAlign,
          TextOverflow? overflow,
          Color? backgroundColor,
          double? lineHeight}) =>
      _toText(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        maxLine: maxLine,
        textAlign: textAlign,
        lineHeight: lineHeight,
        backgroundColor: backgroundColor,
        color: color,
        overflow: overflow,
      );
}

extension FontSizeExtension on num {
  static const double _figmaScreenWidth = 430; // Hardcoded Figma screen width

  double fsp() {
    // Access the current screen width using MediaQuery
    final screenWidth = MediaQuery.of(navigatorKey.currentContext!).size.width;

    // Calculate the scaled font size
    return (this / _figmaScreenWidth) * screenWidth;
  }
}