import 'package:flutter/services.dart';

//primary swatch
const Map<int, Color> primaryColor = {
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

const redPrimary = Color.fromRGBO(255, 0, 0, 1);
const redSecondary = Color.fromRGBO(222, 0, 0, 1);
const redTertiary = Color.fromRGBO(255, 66, 41, 1);

const blackDark = Color.fromRGBO(0, 0, 0, 1);
const blackPrimary = Color.fromRGBO(48, 44, 43, 1);
const blackSecondary = Color.fromRGBO(35, 35, 35, 1);
const blackLight = Color.fromRGBO(18, 18, 18, 1);

const whitePrimary = Color.fromRGBO(255, 255, 255, 1);
const whiteSecondary = Color.fromRGBO(245, 245, 245, 1);
const whiteShadow = Color.fromRGBO(238, 238, 238, 1);

const greenPrimary = Color.fromRGBO(87, 173, 87, 1);
const greyLight = Color.fromRGBO(153, 153, 153, 1);
const preLudeLight = Color.fromRGBO(202, 186, 232, 1);

const azurePrimary = Color.fromRGBO(48, 106, 153, 1);

// Splash radial gradiane
const radialGradientColor = [
  Color.fromRGBO(88, 79, 204, 1),
  Color.fromRGBO(10, 1, 24, 1),
];

const buttonLinearGradiantColor = [
  Color.fromRGBO(88, 79, 204, 1),
  Color.fromRGBO(2, 219, 245, 1),
];

// statusBar
whiteStatusBar() {
  return const SystemUiOverlayStyle(
      statusBarColor: whitePrimary,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: whitePrimary,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: whitePrimary);
}
