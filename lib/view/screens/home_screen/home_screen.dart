import 'package:flutter_base_bloc/helper/block_helper.dart';
import 'package:flutter_base_bloc/helper/connection_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/prrimary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';
import 'package:flutter_base_bloc/view/widgets/theme_toggle_widget.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_colors.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/bloc/home_bloc/home_bloc.dart';

import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    callingAPIs();
    super.initState();
  }

  callingAPIs() {
    // Call APIs
    BlocHelper.readHomeBloc.add(HomeInitialized());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            return Scaffold(
              appBar: AppBar(
                title: AppStrings.homeText.toText(
                  fontSize: 18,
                  fontWeight: AppStyle.w600,
                ),
                centerTitle: true,
                backgroundColor: AppThemeColors.getSurface(
                  themeState.themeMode,
                ),
                actions: [const ThemeToggleWidget(), 8.width],
              ),
              body: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: AppThemeColors.getCardColor(themeState.themeMode),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.home,
                              size: 64,
                              color: AppThemeColors.getPrimary(
                                themeState.themeMode,
                              ),
                            ),
                            16.height,
                            AppStrings.welcomeToHome.toText(
                              fontSize: 20,
                              fontWeight: AppStyle.w600,
                              textAlign: TextAlign.center,
                            ),
                            8.height,
                            AppStrings.homeDescription.toText(
                              fontSize: 14,
                              textAlign: TextAlign.center,
                            ),
                            24.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: PrimaryButton(
                                    buttonName: AppStrings.testConnection,
                                    onPressed: () {
                                      ConnectionManager().showInternetError();
                                    },
                                  ),
                                ),
                                20.width,
                                Expanded(
                                  child: PrimaryButton(
                                    buttonName: AppStrings.themeDemo,
                                    onPressed: () {
                                      goToNamed(RouterHelper.themeDemoScreen);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).center,
              ),
            );
          },
        );
      },
    );
  }
}
