import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/bloc/navigation_bloc/bottom_navigation_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/view/widgets/bottom_navigation.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_colors.dart';
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

            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: AppColors.systemUiOverlayStyle(context),
              child: Scaffold(
                backgroundColor: AppThemeColors.getSurface(
                  themeState.themeMode,
                ),
                body: bottomNavigationIndex[currentIndex],
                bottomNavigationBar: BottomNavigation(
                  currentIndex: currentIndex,
                  themeMode: themeState.themeMode,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
