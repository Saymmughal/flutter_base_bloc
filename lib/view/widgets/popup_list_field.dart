import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_base_bloc/utils/app_assets.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/svg_image.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';

class PopupListField extends StatelessWidget {
  const PopupListField({
    super.key,
    required this.label,
    required this.hintText,
    required this.fieldText,
    required this.onPressed,
  });
  final String label;
  final String hintText;
  final String fieldText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.toText(
          fontSize: 14,
          color: AppColors.blackSecondary,
          fontWeight: AppStyle.w500,
        ),
        5.height,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blackLight),
            borderRadius: BorderRadius.circular(5),
          ),
          child:
              Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: fieldText.toText(
                                fontSize: 16,
                                color: AppColors.blackSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          svgAssetImage(AppIcons.iconDropdown),
                          8.width,
                        ],
                      ),
                    ],
                  )
                  .paddingSymmetric(horizontal: 12.h, vertical: 16.h)
                  .onPress(onPressed),
        ),
      ],
    );
  }
}
