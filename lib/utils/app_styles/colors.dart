import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  // Primary swatch For Light Theme
  static const Map<int, Color> lightThePrimaryColor = {
    50: Color.fromRGBO(48, 106, 153, 0.1),
    100: Color.fromRGBO(48, 106, 153, 0.2),
    200: Color.fromRGBO(48, 106, 153, 0.3),
    300: Color.fromRGBO(48, 106, 153, 0.4),
    400: Color.fromRGBO(48, 106, 153, 0.5),
    500: Color.fromRGBO(48, 106, 153, 0.6),
    600: Color.fromRGBO(48, 106, 153, 0.7),
    700: Color.fromRGBO(48, 106, 153, 0.8),
    800: Color.fromRGBO(48, 106, 153, 0.9),
    900: Color.fromRGBO(48, 106, 153, 1),
  };

  // Primary swatch For Dark Theme
  static const Map<int, Color> darkThePrimaryColor = {
    50: Color.fromRGBO(87, 173, 87, 0.1),
    100: Color.fromRGBO(87, 173, 87, 0.2),
    200: Color.fromRGBO(87, 173, 87, 0.3),
    300: Color.fromRGBO(87, 173, 87, 0.4),
    400: Color.fromRGBO(87, 173, 87, 0.5),
    500: Color.fromRGBO(87, 173, 87, 0.6),
    600: Color.fromRGBO(87, 173, 87, 0.7),
    700: Color.fromRGBO(87, 173, 87, 0.8),
    800: Color.fromRGBO(87, 173, 87, 0.9),
    900: Color.fromRGBO(87, 173, 87, 1),
  };

  static const transparentColor = Colors.transparent;
  static const redPrimary = Color.fromRGBO(255, 0, 0, 1);
  static const redSecondary = Color.fromRGBO(222, 0, 0, 1);
  static const redTertiary = Color.fromRGBO(255, 66, 41, 1);
  static const blackDark = Color.fromRGBO(0, 0, 0, 1);
  static const blackPrimary = Color.fromRGBO(48, 44, 43, 1);
  static const blackSecondary = Color.fromRGBO(35, 35, 35, 1);
  static const blackLight = Color.fromRGBO(18, 18, 18, 1);
  static const whitePrimary = Color.fromRGBO(255, 255, 255, 1);
  static const whiteSecondary = Color.fromRGBO(245, 245, 245, 1);
  static const whiteShadow = Color.fromRGBO(238, 238, 238, 1);
  static const greenPrimary = Color.fromRGBO(87, 173, 87, 1);
  static const greyLight = Color.fromRGBO(153, 153, 153, 1);
  static const preLudeLight = Color.fromRGBO(202, 186, 232, 1);
  static const azurePrimary = Color.fromRGBO(48, 106, 153, 1);
  static const shimmerBaseColor = Color.fromRGBO(200, 200, 200, 0.6);
  static const shimmerHighlightColor = Color.fromRGBO(243, 243, 243, 0.66);

  // Splash radial gradient
  static const radialGradientColor = [
    Color.fromRGBO(88, 79, 204, 1),
    Color.fromRGBO(10, 1, 24, 1),
  ];

  static const buttonLinearGradiantColor = [
    Color.fromRGBO(88, 79, 204, 1),
    Color.fromRGBO(2, 219, 245, 1),
  ];

  // statusBar
  static const whiteStatusBar = SystemUiOverlayStyle(
    statusBarColor: whitePrimary,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: whitePrimary,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: whitePrimary,
  );

  static const transparentStatusBar = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  );

  static systemUiOverlayStyle(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? whiteStatusBar
        : transparentStatusBar;
  }
}
