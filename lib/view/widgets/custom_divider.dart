import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color, this.thickness});
  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.blackLight,
      thickness: thickness ?? 1.0,
    );
  }
}
