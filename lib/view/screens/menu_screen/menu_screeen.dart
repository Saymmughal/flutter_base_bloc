import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_colors.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final currentThemeMode = state.themeMode;

        return Scaffold(
          appBar: AppBar(
            title: AppStrings.menuText.toText(
              fontSize: 18,
              fontWeight: AppStyle.w600,
            ),
            centerTitle: true,
            backgroundColor: AppThemeColors.getSurface(currentThemeMode),
          ),
          backgroundColor: AppThemeColors.getSurface(currentThemeMode),
          body: Container(child: AppStrings.menuScreen.toText()).center,
        );
      },
    );
  }
}
