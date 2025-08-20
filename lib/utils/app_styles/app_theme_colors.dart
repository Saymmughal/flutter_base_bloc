import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';

class AppThemeColors {
  // Cache for system brightness to avoid repeated calculations
  static Brightness? _cachedSystemBrightness;
  static DateTime? _lastBrightnessCheck;
  static const Duration _brightnessCacheDuration = Duration(milliseconds: 100);

  // Get cached system brightness with throttling
  static Brightness _getCachedSystemBrightness() {
    final now = DateTime.now();
    if (_cachedSystemBrightness == null ||
        _lastBrightnessCheck == null ||
        now.difference(_lastBrightnessCheck!) > _brightnessCacheDuration) {
      _cachedSystemBrightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      _lastBrightnessCheck = now;
    }
    return _cachedSystemBrightness!;
  }

  static Color getPrimary(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.greenPrimary;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.azurePrimary;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.greenPrimary
          : AppColors.azurePrimary;
    }
  }

  static Color getSecondary(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.azurePrimary;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.greenPrimary;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.azurePrimary
          : AppColors.greenPrimary;
    }
  }

  static Color getSurface(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.blackLight;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.whitePrimary;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.blackLight
          : AppColors.whitePrimary;
    }
  }

  static Color getBackground(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.blackLight;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.whitePrimary;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.blackLight
          : AppColors.whitePrimary;
    }
  }

  static Color getCardColor(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.blackSecondary;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.whitePrimary;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.blackSecondary
          : AppColors.whitePrimary;
    }
  }

  static Color getTextPrimary(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.whitePrimary;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.blackPrimary;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.whitePrimary
          : AppColors.blackPrimary;
    }
  }

  static Color getTextSecondary(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.greyLight;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.greyLight;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.greyLight
          : AppColors.greyLight;
    }
  }

  static Color getTextOnPrimary(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.whitePrimary;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.whitePrimary;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.whitePrimary
          : AppColors.whitePrimary;
    }
  }

  static Color getTextOnSurface(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.whitePrimary;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.blackPrimary;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.whitePrimary
          : AppColors.blackPrimary;
    }
  }

  static Color getError(AppThemeMode themeMode) {
    return AppColors.redPrimary;
  }

  static Color getDivider(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.blackSecondary;
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.whiteShadow;
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.blackSecondary
          : AppColors.whiteShadow;
    }
  }

  static Color getShadow(AppThemeMode themeMode) {
    if (themeMode == AppThemeMode.dark) {
      return AppColors.blackDark.withValues(alpha: 77);
    } else if (themeMode == AppThemeMode.light) {
      return AppColors.blackDark.withValues(alpha: 26);
    } else {
      // System mode - use cached brightness
      final brightness = _getCachedSystemBrightness();
      return brightness == Brightness.dark
          ? AppColors.blackDark.withValues(alpha: 77)
          : AppColors.blackDark.withValues(alpha: 26);
    }
  }

  // Clear cache when needed (e.g., during app lifecycle changes)
  static void clearCache() {
    _cachedSystemBrightness = null;
    _lastBrightnessCheck = null;
  }
}
