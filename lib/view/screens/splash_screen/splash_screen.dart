import 'dart:async';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_colors.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routes();
  }

  void routes() async {
    Timer(const Duration(seconds: 3), () async {
      //   bool? isLogin = await LocalDb.getLogin;
      //   if (isLogin == true) {
      //   } else {
      goReplacementNamed(RouterHelper.logInScreen);
      //   }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final currentThemeMode = state.themeMode;

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppThemeColors.getPrimary(currentThemeMode),
                  AppThemeColors.getSecondary(currentThemeMode),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Icon/Logo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppThemeColors.getTextOnPrimary(currentThemeMode),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      Icons.flutter_dash,
                      size: 80,
                      color: AppThemeColors.getPrimary(currentThemeMode),
                    ),
                  ),
                  32.height,

                  // App Title
                  AppStrings.appTitle.toText(
                    fontSize: 28,
                    fontWeight: AppStyle.w700,
                    color: AppThemeColors.getTextOnPrimary(currentThemeMode),
                  ),
                  8.height,

                  // App Subtitle
                  'Flutter + BLoC + Dark Theme'.toText(
                    fontSize: 16,
                    color: AppThemeColors.getTextOnPrimary(
                      currentThemeMode,
                    ).withValues(alpha: 204),
                  ),
                  48.height,

                  // Loading Indicator
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppThemeColors.getTextOnPrimary(currentThemeMode),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
