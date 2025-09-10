import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/view/widgets/custom_snackbar.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionManager {
  // Singleton instance
  static final ConnectionManager _instance = ConnectionManager._internal();
  factory ConnectionManager() => _instance;
  ConnectionManager._internal();

  final Connectivity _connectivity = Connectivity();
  final InternetConnection _internetChecker = InternetConnection();
  bool _isConnected = true; // Connection status variable
  bool _isFirstTime = true; // To avoid toast on initial load
  final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  // Performance optimization: Debounce connection checks
  Timer? _connectionCheckTimer;
  bool _isCheckingConnection = false;
  static const Duration _debounceDelay = Duration(milliseconds: 500);

  Stream<bool> get connectionStream => _connectionController.stream;

  bool get isConnected =>
      _isConnected; // Public getter for the connection status

  /// Creates a Dio interceptor that checks internet connectivity before API calls
  Interceptor createConnectionInterceptor() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        try {
          debugPrint(
            '🔌 ConnectionManager: Checking internet connection for ${options.path}',
          );

          // Quick check first using the current status
          if (!_isConnected) {
            debugPrint(
              '❌ ConnectionManager: No internet connection (quick check failed)',
            );
            // If no internet connection, reject the request immediately
            handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.connectionError,
                error: AppStrings.internetConnectionMessage,
              ),
            );
            return;
          }

          debugPrint(
            '✅ ConnectionManager: Internet connection available, proceeding with request',
          );
          // If internet connection is available, proceed with the request
          handler.next(options);
        } catch (e) {
          debugPrint('❌ ConnectionManager: Error checking connection: $e');
          // If there's an error checking connection, reject the request
          handler.reject(
            DioException(
              requestOptions: options,
              type: DioExceptionType.connectionError,
              error: AppStrings.internetConnectionMessage,
            ),
          );
        }
      },
      onError: (DioException err, ErrorInterceptorHandler handler) {
        // Handle connection errors specifically
        if (err.type == DioExceptionType.connectionError) {
          // Check if it's a connection error due to no internet
          if (!_isConnected) {
            // Create a custom error response for no internet
            final customError = DioException(
              requestOptions: err.requestOptions,
              type: DioExceptionType.connectionError,
              error: AppStrings.internetConnectionMessage,
            );
            handler.reject(customError);
            return;
          }
        }

        // For other types of errors, pass them through
        handler.next(err);
      },
    );
  }

  void initialize() {
    // Initial connection check in background
    _checkInitialConnectionAsync();

    Future.delayed(Duration(seconds: 2), () {
      _isFirstTime = false; // After 2 seconds, allow toasts for changes
    });

    // Listen for connection changes with debouncing
    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      // Debounce connection checks to avoid excessive network calls
      _debouncedConnectionCheck(results);
    });
  }

  /// Debounced connection check to prevent excessive network calls
  void _debouncedConnectionCheck(List<ConnectivityResult> results) {
    _connectionCheckTimer?.cancel();
    _connectionCheckTimer = Timer(_debounceDelay, () {
      _checkConnectionAsync(results);
    });
  }

  /// Check connection asynchronously to avoid blocking main thread
  Future<void> _checkConnectionAsync(List<ConnectivityResult> results) async {
    if (_isCheckingConnection) return; // Prevent concurrent checks

    _isCheckingConnection = true;

    try {
      // Check if there is at least one valid connectivity result
      final hasNetwork =
          results.isNotEmpty &&
          results.any((result) => result != ConnectivityResult.none);

      if (hasNetwork) {
        // Verify active internet connection in background
        final hasInternet = await _internetChecker.hasInternetAccess;
        _updateConnectionStateAsync(hasInternet);
      } else {
        _updateConnectionStateAsync(false);
      }
    } finally {
      _isCheckingConnection = false;
    }
  }

  /// Check initial connection asynchronously
  Future<void> _checkInitialConnectionAsync() async {
    try {
      debugPrint('🔍 ConnectionManager: Checking initial connection...');
      final connectivityResults = await _connectivity.checkConnectivity();
      final hasNetwork =
          connectivityResults.isNotEmpty &&
          connectivityResults.any(
            (result) => result != ConnectivityResult.none,
          );

      if (hasNetwork) {
        final hasInternet = await _internetChecker.hasInternetAccess;
        debugPrint(
          '🔍 ConnectionManager: Network available, internet access: $hasInternet',
        );
        _updateConnectionStateAsync(hasInternet); // No toast on initial load
      } else {
        debugPrint('🔍 ConnectionManager: No network available');
        _updateConnectionStateAsync(false); // No toast on initial load
      }
    } catch (e) {
      debugPrint('❌ ConnectionManager: Error checking initial connection: $e');
      _updateConnectionStateAsync(false); // No toast on initial load
    }
  }

  /// Check current internet connectivity status
  Future<bool> checkInternetConnection() async {
    try {
      final hasInternet = await _internetChecker.hasInternetAccess;
      _updateConnectionStateAsync(hasInternet);
      return hasInternet;
    } catch (e) {
      _updateConnectionStateAsync(false);
      return false;
    }
  }

  /// Update connection state asynchronously to avoid blocking main thread
  void _updateConnectionStateAsync(bool hasConnection) {
    if (_isConnected != hasConnection) {
      _isConnected = hasConnection;
      debugPrint(
        '🌐 ConnectionManager: Connection status changed to: ${_isConnected ? "Connected" : "Disconnected"}',
      );
      _connectionController.add(_isConnected); // Notify listeners of the change

      // Schedule UI operations to run after current frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateUIForConnectionState();
      });
    } else if (!_isConnected && !isSnackbarActive) {
      // Only show no internet toast if we're still disconnected and no snackbar is active
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showNoInternetToast();
      });
    }
  }

  /// Update UI for connection state changes (runs on main thread after frame)
  void _updateUIForConnectionState() {
    try {
      // Always hide current snackbar first and reset the flag
      ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
      isSnackbarActive = false; // Reset the flag to allow new toasts

      // Skip toast on initial load only if connected
      if (_isFirstTime && _isConnected) return;

      // Show appropriate toast based on connection state
      showToast(
        message: _isConnected
            ? '✅ Connected to the Internet'
            : '❌ No Internet Connection',
        isError: !_isConnected,
        isInternet: !_isConnected,
      );

      debugPrint(
        '🍞 ConnectionManager: Toast shown - ${_isConnected ? "Connected" : "Disconnected"}',
      );
    } catch (e) {
      debugPrint('❌ ConnectionManager: Error updating UI: $e');
    }
  }

  /// Show no internet toast (runs on main thread after frame)
  void _showNoInternetToast() {
    try {
      // Hide current snackbar and reset flag
      ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
      isSnackbarActive = false;

      showToast(
        message: '❌ No Internet Connection',
        isError: true,
        isInternet: true,
      );
      debugPrint('🍞 ConnectionManager: No internet toast shown');
    } catch (e) {
      debugPrint('❌ ConnectionManager: Error showing no internet toast: $e');
    }
  }

  /// Force refresh connection state and update UI
  Future<void> refreshConnectionState() async {
    debugPrint('🔄 ConnectionManager: Force refreshing connection state...');
    final hasInternet = await checkInternetConnection();
    _updateConnectionStateAsync(hasInternet);
  }

  /// Show internet error dialog (for testing purposes)
  void showInternetError() {
    debugPrint('🔌 ConnectionManager: Showing internet error dialog...');
    _updateConnectionStateAsync(false);
  }

  /// Force dismiss current snackbar
  void dismissCurrentSnackbar() {
    try {
      ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
      isSnackbarActive = false;
      debugPrint('🍞 ConnectionManager: Current snackbar dismissed');
    } catch (e) {
      debugPrint('❌ ConnectionManager: Error dismissing snackbar: $e');
    }
  }

  void dispose() {
    _connectionCheckTimer?.cancel();
    _connectionController.close();
  }
}
