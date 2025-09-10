
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/dimension_manager.dart';


extension IntExtension on int {
  // Extension use for sized box
  // To create space vertically of horizontally

   Widget get height =>
      SizedBox(height: DimensionManager.instance.widgetHeight(toDouble()));

  Widget get width =>
      SizedBox(width: DimensionManager.instance.widgetWidth(toDouble()));

  // Extension use for height and width of the widget

  double get h => DimensionManager.instance.widgetHeight(toDouble());

  double get w => DimensionManager.instance.widgetWidth(toDouble());
}
