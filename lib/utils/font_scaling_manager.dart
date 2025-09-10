

import 'package:flutter_base_bloc/utils/app_constants.dart';
import 'package:flutter_base_bloc/utils/dimension_manager.dart';

/// Optimized font scaling manager that caches calculations
class FontScalingManager {
  static FontScalingManager? _instance;
  static FontScalingManager get instance =>
      _instance ??= FontScalingManager._();

  FontScalingManager._();

  // Cache for font scale factors
  final Map<double, double> _fontScaleCache = {};
  double? _lastScreenDimension;
  bool? _lastIsLandscape;

  /// Get scaled font size with caching
  double getScaledFontSize(double fontSize) {
    final dimensionManager = DimensionManager.instance;
    final currentScreenDimension = dimensionManager.isLandscapePossible
        ? dimensionManager.screenHeight
        : dimensionManager.screenWidth;

    // Check if we need to refresh cache
    if (_lastScreenDimension != currentScreenDimension ||
        _lastIsLandscape != dimensionManager.isLandscapePossible) {
      _fontScaleCache.clear();
      _lastScreenDimension = currentScreenDimension;
      _lastIsLandscape = dimensionManager.isLandscapePossible;
    }

    // Return cached value if available
    if (_fontScaleCache.containsKey(fontSize)) {
      return _fontScaleCache[fontSize]!;
    }

    // Calculate and cache new value
    final scaleFactor = currentScreenDimension;
    final scaledSize = (fontSize / AppConstants.designWidth) * scaleFactor;
    _fontScaleCache[fontSize] = scaledSize;

    return scaledSize;
  }

  /// Clear cache when screen dimensions change
  void clearCache() {
    _fontScaleCache.clear();
    _lastScreenDimension = null;
    _lastIsLandscape = null;
  }

  /// Pre-calculate common font sizes for better performance
  void preCalculateCommonSizes() {
    final commonSizes = [
      8.0,
      10.0,
      12.0,
      14.0,
      16.0,
      18.0,
      20.0,
      24.0,
      28.0,
      32.0,
    ];
    for (final size in commonSizes) {
      getScaledFontSize(size);
    }
  }
}
