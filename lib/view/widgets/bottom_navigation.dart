import 'package:flutter_base_bloc/bloc_provider/bottom_navigation_bloc/bottom_navigation_cubit.dart';
import 'package:flutter_base_bloc/bloc_provider/bottom_navigation_bloc/bottom_navigation_state.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter_base_bloc/utils/constant.dart';
import 'package:flutter_base_bloc/utils/images.dart';
import 'package:flutter_base_bloc/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/svg_image.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.currentIndex});
  final int currentIndex;
  // Bottom navigation the the bottom navigation bar of the app

  @override
  Widget build(BuildContext context) {
    final blottomNavBloc = BlocProvider.of<BottomNavigationCubit>(context, listen: false);
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: blottomNavBloc.currentIndex == 1 ? greenPrimary : whitePrimary,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: greyLight,
                  blurRadius: 20,
                  offset: Offset(0, 7),
                )
              ]),
          child: Material(
            elevation: 0.0,
            color: whitePrimary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                unselectedFontSize: 10.h,
                selectedFontSize: 10.h,
                selectedLabelStyle: const TextStyle(fontFamily: poppinsRegular),
                unselectedLabelStyle:
                    const TextStyle(fontFamily: poppinsRegular),
                selectedItemColor: preLudeLight,
                unselectedItemColor: blackPrimary,
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: blottomNavBloc.currentIndex,
                onTap: (index) {
                  // set the current index of the bottom navigation bar
                  // the function is declared inside BottomNavigationProvider

                  blottomNavBloc.setCurrentIndex(index);
                  if (currentIndex != index) {
                    switch (index) {
                      case 0:
                        blottomNavBloc.setCurrentIndex(0);
                        break;
                      case 1:
                        blottomNavBloc.setCurrentIndex(1);
                        break;
                      default:
                        break;
                    }
                  }
                },
                items: <BottomNavigationBarItem>[
                  // Remote
                  BottomNavigationBarItem(
                      icon: svgAssetImage(
                        blottomNavBloc.currentIndex == 0
                            ? Images.iconHomeFilled
                            : Images.iconHome,
                        height: 22.h,
                        width: 22.h,
                      ).paddingOnly(bottom: 5.h),
                      label: Constant.homeText),
                  // // More
                  BottomNavigationBarItem(
                      icon: svgAssetImage(
                        blottomNavBloc.currentIndex == 1
                            ? Images.iconMenuFilled
                            : Images.iconMenu,
                        height: 18.h,
                        width: 18.h,
                      ).paddingOnly(bottom: 5.h),
                      label: Constant.menuText),
                ]),
          ),
        );
      },
    );
  }
}
