import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';
import '../../utils/app_styles/colors.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.isActive,
    this.radioActiveColor,
    required this.onTap,
    this.radioSize,
  });

  final VoidCallback onTap;
  final bool isActive;
  final Color? radioActiveColor;
  final double? radioSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radioSize ?? 20.h,
      width: radioSize ?? 20.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: radioActiveColor ?? AppColors.greenPrimary),
      ),
      child: Container(
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          color: isActive == true
              ? (radioActiveColor ?? AppColors.greenPrimary)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
      ).paddingAll(2.0),
    ).onPress(onTap);
  }
}

class CustomRadioWithoutTap extends StatelessWidget {
  const CustomRadioWithoutTap({
    super.key,
    required this.isActive,
    this.radioActiveColor,
    this.radioSize,
  });

  final bool isActive;
  final Color? radioActiveColor;
  final double? radioSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radioSize ?? 20.h,
      width: radioSize ?? 20.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: radioActiveColor ?? AppColors.greenPrimary),
      ),
      child: Container(
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          color: isActive == true
              ? (radioActiveColor ?? AppColors.greenPrimary)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
      ).paddingAll(2.0),
    );
  }
}
