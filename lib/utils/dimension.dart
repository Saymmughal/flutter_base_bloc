import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_constants.dart';
import '../main.dart';

double get screenHeight =>
    MediaQuery.of(navigatorKey.currentContext!).size.height;
double get screenWidth =>
    MediaQuery.of(navigatorKey.currentContext!).size.width;

double widgetHeight(double pixels) {
  return MediaQuery.of(navigatorKey.currentContext!).size.height /
      (AppConstants.designHeight / pixels);
}

double widgetWidth(double pixels) {
  return MediaQuery.of(navigatorKey.currentContext!).size.width /
      (AppConstants.designWidth / pixels);
}
