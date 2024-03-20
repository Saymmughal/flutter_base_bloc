// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';

import '../../utils/colors.dart';
import 'extention/border_extension.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.buttonTextColor = whitePrimary,
      this.buttonGradientColor = buttonLinearGradiantColor,
      this.height,
      this.width,
      this.radius = 10,
      this.textSize = 16});

  String buttonName;
  VoidCallback onPressed;
  List<Color> buttonGradientColor;
  Color buttonTextColor = whitePrimary;
  double? height;
  double? width;
  double radius;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            height: height ?? 44.h,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
                borderRadius: borderRadiusCircular(radius),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: buttonGradientColor,
                )),
            child: buttonName
                .toText(
                  color: buttonTextColor,
                  fontSize: textSize,
                )
                .center));
  }
}
