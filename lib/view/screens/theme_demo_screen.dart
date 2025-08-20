import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/view/widgets/theme_toggle_widget.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_colors.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';

class ThemeDemoScreen extends StatelessWidget {
  const ThemeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final currentThemeMode = state.themeMode;

        return Scaffold(
          appBar: AppBar(
            title: AppStrings.themeDemo.toText(),
            backgroundColor: AppThemeColors.getSurface(currentThemeMode),
            actions: [const ThemeToggleWidget(), 16.width],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Current Theme Info
                Card(
                  color: AppThemeColors.getCardColor(currentThemeMode),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppStrings.currentTheme.toText(
                          fontSize: 20,
                          fontWeight: AppStyle.w600,
                        ),
                        8.height,
                        Row(
                          children: [
                            Icon(
                              _getThemeIcon(currentThemeMode),
                              color: AppThemeColors.getPrimary(
                                currentThemeMode,
                              ),
                            ),
                            16.width,
                            _getThemeName(
                              currentThemeMode,
                            ).toText(fontSize: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                16.height,

                // Typography Section
                AppStrings.typography.toText(
                  fontSize: 18,
                  fontWeight: AppStyle.w600,
                ),
                16.height,
                Card(
                  color: AppThemeColors.getCardColor(currentThemeMode),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppStrings.displayLarge.toText(
                          fontSize: 32,
                          fontWeight: AppStyle.w700,
                        ),
                        AppStrings.displayMedium.toText(
                          fontSize: 28,
                          fontWeight: AppStyle.w700,
                        ),
                        AppStrings.headlineLarge.toText(
                          fontSize: 22,
                          fontWeight: AppStyle.w700,
                        ),
                        AppStrings.titleLarge.toText(
                          fontSize: 16,
                          fontWeight: AppStyle.w700,
                        ),
                        AppStrings.bodyLarge.toText(fontSize: 16),
                        AppStrings.bodyMedium.toText(fontSize: 14),
                        AppStrings.labelLarge.toText(
                          fontSize: 14,
                          fontWeight: AppStyle.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                16.height,

                // Colors Section
                AppStrings.colors.toText(
                  fontSize: 18,
                  fontWeight: AppStyle.w600,
                ),
                16.height,
                Card(
                  color: AppThemeColors.getCardColor(currentThemeMode),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppThemeColors.getPrimary(
                                  currentThemeMode,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            16.width,
                            AppStrings.primaryColor.toText(),
                          ],
                        ),
                        8.height,
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppThemeColors.getSecondary(
                                  currentThemeMode,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            16.width,
                            AppStrings.secondaryColor.toText(),
                          ],
                        ),
                        8.height,
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppThemeColors.getSurface(
                                  currentThemeMode,
                                ),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: AppThemeColors.getTextOnSurface(
                                    currentThemeMode,
                                  ),
                                ),
                              ),
                            ),
                            16.width,
                            AppStrings.surfaceColor.toText(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _getThemeIcon(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
      case AppThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  String _getThemeName(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return AppStrings.lightTheme;
      case AppThemeMode.dark:
        return AppStrings.darkTheme;
      case AppThemeMode.system:
        return AppStrings.systemTheme;
    }
  }
}
