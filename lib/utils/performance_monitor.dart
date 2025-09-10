import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

/// Performance monitoring utility to track main thread performance
class PerformanceMonitor {
  static PerformanceMonitor? _instance;
  static PerformanceMonitor get instance =>
      _instance ??= PerformanceMonitor._();

  PerformanceMonitor._();

  int _frameCount = 0;
  int _droppedFrames = 0;
  final List<double> _frameTimes = [];

  /// Initialize performance monitoring
  void initialize() {
    if (kDebugMode) {
      SchedulerBinding.instance.addTimingsCallback(_onFrameTimings);
    }
  }

  /// Handle frame timings
  void _onFrameTimings(List<FrameTiming> timings) {
    for (final timing in timings) {
      _frameCount++;
      final frameTime =
          timing.totalSpan.inMicroseconds / 1000.0; // Convert to milliseconds
      _frameTimes.add(frameTime);

      // Track dropped frames (frames that take longer than 16.67ms for 60fps)
      if (frameTime > 16.67) {
        _droppedFrames++;
      }

      // Keep only last 100 frame times for rolling average
      if (_frameTimes.length > 100) {
        _frameTimes.removeAt(0);
      }
    }
  }

  /// Get current performance metrics
  Map<String, dynamic> getPerformanceMetrics() {
    final averageFrameTime = _frameTimes.isNotEmpty
        ? _frameTimes.reduce((a, b) => a + b) / _frameTimes.length
        : 0.0;

    final droppedFramePercentage = _frameCount > 0
        ? (_droppedFrames / _frameCount) * 100
        : 0.0;

    return {
      'totalFrames': _frameCount,
      'droppedFrames': _droppedFrames,
      'droppedFramePercentage': droppedFramePercentage,
      'averageFrameTime': averageFrameTime,
      'fps': averageFrameTime > 0 ? 1000 / averageFrameTime : 0,
    };
  }

  /// Log performance metrics
  void logPerformanceMetrics() {
    if (kDebugMode) {
      final metrics = getPerformanceMetrics();
      debugPrint('=== Performance Metrics ===');
      debugPrint('Total Frames: ${metrics['totalFrames']}');
      debugPrint('Dropped Frames: ${metrics['droppedFrames']}');
      debugPrint(
        'Dropped Frame %: ${metrics['droppedFramePercentage'].toStringAsFixed(2)}%',
      );
      debugPrint(
        'Average Frame Time: ${metrics['averageFrameTime'].toStringAsFixed(2)}ms',
      );
      debugPrint('FPS: ${metrics['fps'].toStringAsFixed(1)}');
      debugPrint('========================');
    }
  }

  /// Reset performance counters
  void reset() {
    _frameCount = 0;
    _droppedFrames = 0;
    _frameTimes.clear();
  }

  /// Check if performance is good (less than 5% dropped frames)
  bool get isPerformanceGood {
    final metrics = getPerformanceMetrics();
    return metrics['droppedFramePercentage'] < 5.0;
  }
}
