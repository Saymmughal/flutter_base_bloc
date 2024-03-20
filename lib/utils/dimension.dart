import 'package:flutter/material.dart';

import 'constant.dart';

mediaQuerySize(BuildContext context) {
  mediaQuery = MediaQuery.of(context).size;
}

// ignore: prefer_typing_uninitialized_variables
var mediaQuery;

double get screenHeight =>  mediaQuery.height;
double get screenWidth => mediaQuery.width;

double widgetHeight(double pixels) {
  return mediaQuery.height / (Constant.designHeight / pixels);
}

double widgetWidth(double pixels) {
  return mediaQuery.width / (Constant.designWidth / pixels);
}