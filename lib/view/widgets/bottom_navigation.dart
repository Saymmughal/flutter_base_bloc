import 'package:flutter_base_bloc/bloc/navigation_bloc/bottom_navigation_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/helper/block_helper.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_colors.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';
import 'package:flutter_base_bloc/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/svg_image.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.themeMode,
  });

  final int currentIndex;
  final AppThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        final currentIndexState = state.currentIndex;

        return Container(
          decoration: BoxDecoration(
            color: AppThemeColors.getSurface(themeMode),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: AppColors.greyLight,
                blurRadius: 20,
                offset: Offset(0, 7),
              ),
            ],
          ),
          child: Material(
            elevation: 0.0,
            color: AppThemeColors.getSurface(themeMode),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedFontSize: 10.h,
              selectedFontSize: 10.h,
              selectedLabelStyle: AppStyle.labelMedium,
              unselectedLabelStyle: AppStyle.labelMedium,
              selectedItemColor: AppThemeColors.getPrimary(themeMode),
              unselectedItemColor: AppThemeColors.getTextOnSurface(themeMode),
              backgroundColor: AppThemeColors.getSurface(themeMode),
              elevation: 8,
              currentIndex: currentIndexState,
              onTap: (index) {
                // set the current index of the bottom navigation bar
                BlocHelper.readBottomNavigationBloc.add(
                  BottomNavigationIndexChanged(index),
                );
              },
              items: <BottomNavigationBarItem>[
                // Home
                BottomNavigationBarItem(
                  icon: svgAssetImage(
                    currentIndexState == 0
                        ? AppIcons.iconHomeFilled
                        : AppIcons.iconHome,
                    height: 22.h,
                    width: 22.h,
                    color: currentIndexState == 0
                        ? AppThemeColors.getPrimary(themeMode)
                        : AppThemeColors.getTextOnSurface(
                            themeMode,
                          ).withValues(alpha: 153),
                  ).paddingOnly(bottom: 5.h),
                  label: AppStrings.homeText,
                ),
                // Menu
                BottomNavigationBarItem(
                  icon: svgAssetImage(
                    currentIndexState == 1
                        ? AppIcons.iconMenuFilled
                        : AppIcons.iconMenu,
                    height: 18.h,
                    width: 18.h,
                    color: currentIndexState == 1
                        ? AppThemeColors.getPrimary(themeMode)
                        : AppThemeColors.getTextOnSurface(
                            themeMode,
                          ).withValues(alpha: 153),
                  ).paddingOnly(bottom: 5.h),
                  label: AppStrings.menuText,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
