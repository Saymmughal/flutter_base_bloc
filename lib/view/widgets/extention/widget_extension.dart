//WIDGET EXTENSION
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  // OnPress
  Widget onPress(VoidCallback onTap) => InkWell(onTap: onTap,splashColor: Colors.transparent,
        highlightColor: Colors.transparent, child: this);

  // CENTER
  Widget get center => Center(
        child: this,
      );

  // EXPANDED
  Widget get expanded => Expanded(
        child: this,
      );

  //ALIGN
  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  //BASELINE

  Widget baseline(double width) => Baseline(
        baseline: width,
        baselineType: TextBaseline.alphabetic,
        child: this,
      );

  //BASELINE

  Widget rotate(int degree) => RotatedBox(
        quarterTurns: degree,
        child: this,
      );

  // SINGLE PADDING
  Widget paddingOnly(
          {double top = 0,
          double bottom = 0,
          double left = 0,
          double right = 0}) =>
      Padding(
        padding: EdgeInsets.only(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
        ),
        child: this,
      );

  // ALL PADDING
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  // SYMMETRIC PADDING
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  //POSITIONED
  Widget positioned(
          {double top = 0,
          double bottom = 0,
          double left = 0,
          double right = 0}) =>
      Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: this,
      );
}
