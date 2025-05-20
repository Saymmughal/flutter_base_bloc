import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';

class CrossButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  const CrossButton({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 30.h,
          width: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor ?? (blackPrimary.withValues(alpha: 0.1)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.close,
            color: iconColor ?? blackPrimary,
          ).onPress(onTap ?? () => goBack()),
        ),
      ],
    );
  }
}
