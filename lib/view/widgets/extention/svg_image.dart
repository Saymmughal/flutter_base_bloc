import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget svgAssetImage(String assetName,
        {double? height, double? width, Color? color}) =>
    SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          assetName,
          height: height,
          width: width,
          colorFilter:
              color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
        ));
