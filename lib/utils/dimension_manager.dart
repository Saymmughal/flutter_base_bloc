import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/utils/app_constants.dart';

/// Optimized dimension manager that caches calculations and reduces main thread work
class DimensionManager {
  static DimensionManager? _instance;
  static DimensionManager get instance => _instance ??= DimensionManager._();

  DimensionManager._();

  // Cached values to avoid repeated calculations
  double? _cachedScreenHeight;
  double? _cachedScreenWidth;
  Orientation? _cachedOrientation;
  bool? _cachedIsLandscapePossible;
  double? _cachedAppBarHeight;
  double? _cachedStatusBarHeight;
  double? _cachedBottomBarHeight;
  double? _cachedSafeAreaHeight;

  // Cache invalidation flag
  bool _needsRefresh = true;

  /// Initialize with current screen dimensions
  void initialize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    _updateCache(mediaQuery);
  }

  /// Update cache when orientation changes
  void _updateCache(MediaQueryData mediaQuery) {
    _cachedScreenHeight = mediaQuery.size.height;
    _cachedScreenWidth = mediaQuery.size.width;
    _cachedOrientation = mediaQuery.orientation;
    _cachedStatusBarHeight = mediaQuery.padding.top;
    _cachedBottomBarHeight = mediaQuery.padding.bottom;
    _cachedAppBarHeight = AppBar().preferredSize.height;

    // Calculate landscape possibility asynchronously
    _calculateLandscapePossibility();
    _calculateSafeAreaHeight();

    _needsRefresh = false;
  }

  /// Calculate landscape possibility in background
  void _calculateLandscapePossibility() {
    if (_cachedScreenHeight == null || _cachedScreenWidth == null) return;

    final width = _cachedScreenWidth!;
    final height = _cachedScreenHeight!;

    if (height == 0) {
      _cachedIsLandscapePossible = false;
      return;
    }

    final ratio = width / height;
    const double portraitThreshold = 0.6;
    const double landscapeThreshold = 1.4;

    if (ratio <= portraitThreshold) {
      _cachedIsLandscapePossible = false;
    } else if (ratio >= landscapeThreshold) {
      _cachedIsLandscapePossible = true;
    } else {
      _cachedIsLandscapePossible = false;
    }
  }

  /// Calculate safe area height
  void _calculateSafeAreaHeight() {
    if (_cachedScreenHeight == null ||
        _cachedAppBarHeight == null ||
        _cachedStatusBarHeight == null ||
        _cachedBottomBarHeight == null ||
        _cachedIsLandscapePossible == null) {
      return;
    }

    _cachedSafeAreaHeight =
        (_cachedIsLandscapePossible!
            ? _cachedScreenWidth!
            : _cachedScreenHeight!) -
        _cachedAppBarHeight! -
        _cachedStatusBarHeight! -
        _cachedBottomBarHeight!;
  }

  /// Get screen height (cached)
  double get screenHeight => _cachedScreenHeight ?? 0;

  /// Get screen width (cached)
  double get screenWidth => _cachedScreenWidth ?? 0;

  /// Get orientation (cached)
  Orientation get orientation => _cachedOrientation ?? Orientation.portrait;

  /// Get landscape possibility (cached)
  bool get isLandscapePossible => _cachedIsLandscapePossible ?? false;

  /// Get app bar height (cached)
  double get appBarHeight => _cachedAppBarHeight ?? 0;

  /// Get status bar height (cached)
  double get statusBarHeight => _cachedStatusBarHeight ?? 0;

  /// Get bottom bar height (cached)
  double get bottomBarHeight => _cachedBottomBarHeight ?? 0;

  /// Get safe area height (cached)
  double get safeAreaHeight => _cachedSafeAreaHeight ?? 0;

  /// Calculate widget height with caching
  double widgetHeight(double pixels) {
    if (_needsRefresh ||
        _cachedScreenHeight == null ||
        _cachedScreenWidth == null) {
      _refreshFromContext();
    }

    final h = _cachedScreenHeight!;
    final w = _cachedScreenWidth!;
    final orientation = (w > h) ? Orientation.landscape : Orientation.portrait;
    final base =
        (orientation == Orientation.landscape && _cachedIsLandscapePossible!)
        ? AppConstants.designWidth
        : AppConstants.designHeight;
    return h * (pixels / base);
  }

  /// Calculate widget width with caching
  double widgetWidth(double pixels) {
    if (_needsRefresh ||
        _cachedScreenHeight == null ||
        _cachedScreenWidth == null) {
      _refreshFromContext();
    }

    final h = _cachedScreenHeight!;
    final w = _cachedScreenWidth!;
    final orientation = (w > h) ? Orientation.landscape : Orientation.portrait;
    final base =
        (orientation == Orientation.landscape && _cachedIsLandscapePossible!)
        ? AppConstants.designHeight
        : AppConstants.designWidth;
    return w * (pixels / base);
  }

  /// Refresh cache from current context
  void _refreshFromContext() {
    final context = navigatorKey.currentContext;
    if (context != null) {
      final mediaQuery = MediaQuery.of(context);
      _updateCache(mediaQuery);
    }
  }

  /// Mark cache as needing refresh (call on orientation change)
  void markForRefresh() {
    _needsRefresh = true;
  }

  /// Force refresh cache
  void forceRefresh(BuildContext context) {
    _updateCache(MediaQuery.of(context));
  }
}
