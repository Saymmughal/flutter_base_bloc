import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Creates a copy of this color with the given alpha value.
  /// This is the modern replacement for withOpacity to avoid precision loss.
  Color withValues({int? alpha, int? red, int? green, int? blue}) {
    return Color.fromARGB(
      alpha ?? (a * 255.0).round() & 0xff,
      red ?? (r * 255.0).round() & 0xff,
      green ?? (g * 255.0).round() & 0xff,
      blue ?? (b * 255.0).round() & 0xff,
    );
  }

  /// Creates a copy of this color with the given alpha value.
  /// This is the modern replacement for withOpacity to avoid precision loss.
  Color withAlpha(int alpha) {
    return withValues(alpha: alpha);
  }

  /// Creates a copy of this color with the given red value.
  Color withRed(int red) {
    return withValues(red: red);
  }

  /// Creates a copy of this color with the given green value.
  Color withGreen(int green) {
    return withValues(green: green);
  }

  /// Creates a copy of this color with the given blue value.
  Color withBlue(int blue) {
    return withValues(blue: blue);
  }
}
