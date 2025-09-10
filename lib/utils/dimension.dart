import 'package:flutter_base_bloc/utils/dimension_manager.dart';

// Optimized dimension getters using cached values
double get screenHeight => DimensionManager.instance.screenHeight;
double get screenWidth => DimensionManager.instance.screenWidth;
bool get isLandscapePossible => DimensionManager.instance.isLandscapePossible;
double get appBarHeight => DimensionManager.instance.appBarHeight;
double get statusBarHeight => DimensionManager.instance.statusBarHeight;
double get bottomBarHeight => DimensionManager.instance.bottomBarHeight;
double get safeAreaHeight => DimensionManager.instance.safeAreaHeight;

// Optimized widget dimension calculations using cached values
double widgetHeight(double pixels) =>
    DimensionManager.instance.widgetHeight(pixels);
double widgetWidth(double pixels) =>
    DimensionManager.instance.widgetWidth(pixels);
