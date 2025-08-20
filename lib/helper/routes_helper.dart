import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/view/screens/authentication_screens/login_screen.dart';
import 'package:flutter_base_bloc/view/screens/main_screen/main_screen.dart';
import 'package:flutter_base_bloc/view/screens/splash_screen/splash_screen.dart';
import 'package:flutter_base_bloc/view/screens/theme_demo_screen.dart';

class RouterHelper {
  static const initial = "/";
  static const logInScreen = "/logInScreen";
  static const mainScreen = "/mainScreen";
  static const themeDemoScreen = "/themeDemoScreen";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const SplashScreen(),
    logInScreen: (context) => const LoginScreen(),
    mainScreen: (context) => const MainScreen(),
    themeDemoScreen: (context) => const ThemeDemoScreen(),
  };
}
