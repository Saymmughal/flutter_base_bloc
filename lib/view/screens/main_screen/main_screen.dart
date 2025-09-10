import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_base_bloc/utils/dimension_manager.dart';
import 'package:flutter_base_bloc/utils/font_scaling_manager.dart';
import 'package:flutter_base_bloc/view/widgets/extention/annotated_widget.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/theme_toggle_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/bloc/navigation_bloc/bottom_navigation_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/view/widgets/bottom_navigation.dart';
import 'package:flutter_base_bloc/view/screens/home_screen/home_screen.dart';
import 'package:flutter_base_bloc/view/screens/menu_screen/menu_screeen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, navigationState) {
            final currentIndex = navigationState.currentIndex;
            final bottomNavigationIndex = [HomeScreen(), MenuScreen()];
            final bottomNavigationIndexNameList = ["Home", "Menu"];

            return annotatedRegionWidget(
              context: context,
              child: OrientationBuilder(
                builder: (context, orientation) {
                  // Mark dimension manager for refresh on orientation change
                  DimensionManager.instance.markForRefresh();
                  // Clear font scaling cache on orientation change
                  FontScalingManager.instance.clearCache();
                  return Scaffold(
                    extendBody: true,
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      title: bottomNavigationIndexNameList[currentIndex].toText(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      centerTitle: true,
                      backgroundColor: AppColors.transparentColor,
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: themeState.themeMode == AppThemeMode.dark
                            ? AppColors.whitePrimary
                            : AppColors.blackDark,
                        weight: 14.w,
                      ),
                      systemOverlayStyle: AppColors.whiteStatusBar,
                      actions: [const ThemeToggleWidget(), 8.width],
                    ),
                    body: SafeArea(child: bottomNavigationIndex[currentIndex]),
                    bottomNavigationBar: BottomNavigation(
                      currentIndex: currentIndex,
                      themeMode: themeState.themeMode,
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
