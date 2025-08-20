import 'dart:async';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_base_bloc/view/widgets/show_message_dialog.dart';
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
  final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _connectionController.stream;

  bool get isConnected =>
      _isConnected; // Public getter for the connection status

  void initialize() {
    // Listen for connection changes
    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) async {
      // Check if there is at least one valid connectivity result
      final hasNetwork =
          results.isNotEmpty &&
          results.any((result) => result != ConnectivityResult.none);

      if (hasNetwork) {
        // Verify active internet connection
        final hasInternet = await _internetChecker.hasInternetAccess;
        _updateConnectionState(hasInternet);
      } else {
        _updateConnectionState(false);
      }
    });
  }

  void _updateConnectionState(bool hasConnection) {
    if (_isConnected != hasConnection) {
      _isConnected = hasConnection;
      _connectionController.add(_isConnected); // Notify listeners of the change
    }
  }

  bool showInternetError({VoidCallback? onTap}) {
    if (!isConnected) {
      Future.delayed(Duration(milliseconds: 100), () {
        showMessageDialog(
          message: AppStrings.internetConnectionFailed,
          onTap: onTap,
        );
      });
    }
    return isConnected;
  }

  void dispose() {
    _connectionController.close();
  }
}
