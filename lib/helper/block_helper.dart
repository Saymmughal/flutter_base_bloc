import 'package:flutter_base_bloc/bloc/auth_bloc/login_bloc.dart';
import 'package:flutter_base_bloc/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_base_bloc/bloc/navigation_bloc/bottom_navigation_bloc.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/data/repository/api_repo.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHelper {
  // Read BLoC instances from the current context
  static LoginBloc get readLoginBloc =>
      navigatorKey.currentContext?.read<LoginBloc>() ?? LoginBloc(ApiRepo());
  static ThemeBloc get readThemeBloc =>
      navigatorKey.currentContext?.read<ThemeBloc>() ?? ThemeBloc();
  static HomeBloc get readHomeBloc =>
      navigatorKey.currentContext?.read<HomeBloc>() ?? HomeBloc();
  static BottomNavigationBloc get readBottomNavigationBloc =>
      navigatorKey.currentContext?.read<BottomNavigationBloc>() ??
      BottomNavigationBloc();

  // Watch BLoC instances from the current context
  static LoginBloc get watchLoginBloc =>
      navigatorKey.currentContext?.watch<LoginBloc>() ?? LoginBloc(ApiRepo());
  static ThemeBloc get watchThemeBloc =>
      navigatorKey.currentContext?.watch<ThemeBloc>() ?? ThemeBloc();
  static HomeBloc get watchHomeBloc =>
      navigatorKey.currentContext?.watch<HomeBloc>() ?? HomeBloc();
  static BottomNavigationBloc get watchBottomNavigationBloc =>
      navigatorKey.currentContext?.watch<BottomNavigationBloc>() ??
      BottomNavigationBloc();
}
