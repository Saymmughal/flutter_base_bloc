import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';

import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatelessWidget {
  const ListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColors.shimmerBaseColor,
            highlightColor: AppColors.shimmerHighlightColor,
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.whitePrimary.withValues(alpha: 128),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45.h,
                    width: 45.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whitePrimary,
                    ),
                  ),
                  5.width,
                  SizedBox(
                    height: 60.w,
                    width: 130.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 16.h,
                          width: 140.w,
                          color: AppColors.whitePrimary,
                        ),
                        5.height,
                        Container(
                          height: 16.h,
                          width: 100.w,
                          color: AppColors.whitePrimary,
                        ),
                      ],
                    ),
                  ),
                  10.width,
                  Container(
                    height: 30.h,
                    width: 80.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whitePrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ).paddingSymmetric(horizontal: 16.w, vertical: 10.h),
    );
  }
}
