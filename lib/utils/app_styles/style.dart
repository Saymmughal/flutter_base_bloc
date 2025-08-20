import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';

// fontFamily

class AppStyle {
  static const String poppins = "Poppins";

  // Font Weight
  static const FontWeight w100 = FontWeight.w100; // Thin
  static const FontWeight w200 = FontWeight.w200; // Extra Light
  static const FontWeight w300 = FontWeight.w300; // Light
  static const FontWeight w400 = FontWeight.w400; // Regular
  static const FontWeight w500 = FontWeight.w500; // Medium
  static const FontWeight w600 = FontWeight.w600; // Semi Bold
  static const FontWeight w700 = FontWeight.w700; // Bold
  static const FontWeight w800 = FontWeight.w800; // Extra Bold
  static const FontWeight w900 = FontWeight.w900; // Black

  static TextStyle get poppinsRegularTextStyle => TextStyle(
    fontSize: 12,
    color: AppColors.blackDark,
    fontFamily: poppins,
    fontWeight: w400,
  );

  static TextStyle get poppinsMediumTextStyle => TextStyle(
    fontSize: 12,
    color: AppColors.blackDark,
    fontFamily: poppins,
    fontWeight: w500,
  );

  static TextStyle get poppinsBoldTextStyle => TextStyle(
    fontSize: 12,
    color: AppColors.blackDark,
    fontFamily: poppins,
    fontWeight: w700,
  );

  // Text Styles
  static TextStyle? get labelMedium {
    final context = navigatorKey.currentContext!;
    return Theme.of(context).textTheme.labelMedium;
  }
}
