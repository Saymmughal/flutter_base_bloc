import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/dimension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        // final currentThemeMode = state.themeMode;

        return Container(
          height: safeAreaHeight,
          alignment: Alignment.center,
          child: 'Menu Screen'.toText(),
        );
      },
    );
  }
}
