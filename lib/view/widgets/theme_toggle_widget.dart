import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/helper/block_helper.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_colors.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';

class ThemeToggleWidget extends StatelessWidget {
  final bool showLabel;
  final double size;
  final EdgeInsetsGeometry? padding;

  const ThemeToggleWidget({
    super.key,
    this.showLabel = true,
    this.size = 24.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final currentThemeMode = state.themeMode;

        return PopupMenuButton<AppThemeMode>(
          icon: Icon(
            _getThemeIcon(currentThemeMode),
            size: size,
            color: AppThemeColors.getTextPrimary(currentThemeMode),
          ),
          padding: padding ?? const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 8,
          onSelected: (AppThemeMode themeMode) {
            BlocHelper.readThemeBloc.add(ThemeModeChanged(themeMode));
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<AppThemeMode>(
              value: AppThemeMode.system,
              child: Row(
                children: [
                  Icon(
                    Icons.brightness_auto,
                    color: currentThemeMode == AppThemeMode.system
                        ? AppThemeColors.getPrimary(currentThemeMode)
                        : null,
                  ),
                  if (showLabel) ...[
                    12.width,
                    AppStrings.systemTheme.toText(
                      fontWeight: currentThemeMode == AppThemeMode.system
                          ? AppStyle.w600
                          : AppStyle.w400,
                      color: currentThemeMode == AppThemeMode.system
                          ? AppThemeColors.getPrimary(currentThemeMode)
                          : null,
                    ),
                  ],
                ],
              ),
            ),
            PopupMenuItem<AppThemeMode>(
              value: AppThemeMode.light,
              child: Row(
                children: [
                  Icon(
                    Icons.light_mode,
                    color: currentThemeMode == AppThemeMode.light
                        ? AppThemeColors.getPrimary(currentThemeMode)
                        : null,
                  ),
                  if (showLabel) ...[
                    12.width,
                    AppStrings.lightTheme.toText(
                      fontWeight: currentThemeMode == AppThemeMode.light
                          ? AppStyle.w600
                          : AppStyle.w400,
                      color: currentThemeMode == AppThemeMode.light
                          ? AppThemeColors.getPrimary(currentThemeMode)
                          : null,
                    ),
                  ],
                ],
              ),
            ),
            PopupMenuItem<AppThemeMode>(
              value: AppThemeMode.dark,
              child: Row(
                children: [
                  Icon(
                    Icons.dark_mode,
                    color: currentThemeMode == AppThemeMode.dark
                        ? AppThemeColors.getPrimary(currentThemeMode)
                        : null,
                  ),
                  if (showLabel) ...[
                    12.width,
                    AppStrings.darkTheme.toText(
                      fontWeight: currentThemeMode == AppThemeMode.light
                          ? AppStyle.w600
                          : AppStyle.w400,
                      color: currentThemeMode == AppThemeMode.dark
                          ? AppThemeColors.getPrimary(currentThemeMode)
                          : null,
                    ),
                  ],
                ],
              ),
            ),
          ],
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
}

// Simple theme toggle button for quick switching
class SimpleThemeToggle extends StatelessWidget {
  final double size;
  final EdgeInsetsGeometry? padding;

  const SimpleThemeToggle({super.key, this.size = 24.0, this.padding});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final currentThemeMode = state.themeMode;

        return IconButton(
          icon: Icon(
            Icons.brightness_6,
            size: size,
            color: AppThemeColors.getTextPrimary(currentThemeMode),
          ),
          padding: padding ?? const EdgeInsets.all(8.0),
          onPressed: () {
            BlocHelper.readThemeBloc.add(ThemeToggled());
          },
          tooltip: AppStrings.toggleTheme,
        );
      },
    );
  }
}
