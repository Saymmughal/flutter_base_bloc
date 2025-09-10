// ignore_for_file: file_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static const String _bearerTokenKey = "BearerToken";
  static const String _isLoginKey = "isLogin";
  static const String _userDataKey = "userData";
  static const String _fcmTokenKey = "fcmToken";
  static const String _userIdKey = "userId";
  static const String _themeModeKey = "themeMode";

  // Cache for frequently accessed values to reduce main thread work
  static final Map<String, dynamic> _cache = {};
  static bool _cacheInitialized = false;

  /// Initialize cache to improve performance
  static Future<void> initializeCache() async {
    if (_cacheInitialized) return;

    // Load cache data directly
    final prefs = await SharedPreferences.getInstance();
    _cache[_bearerTokenKey] = prefs.getString(_bearerTokenKey);
    _cache[_isLoginKey] = prefs.getBool(_isLoginKey);
    _cache[_userDataKey] = prefs.getString(_userDataKey);
    _cache[_fcmTokenKey] = prefs.getString(_fcmTokenKey);
    _cache[_userIdKey] = prefs.getInt(_userIdKey);
    _cache[_themeModeKey] = prefs.getInt(_themeModeKey);
    _cacheInitialized = true;
  }

  /// Run operation with proper async scheduling
  static Future<T> _runInBackground<T>(Future<T> Function() operation) async {
    // Use Future.delayed with zero duration to yield control to the event loop
    await Future.delayed(Duration.zero);
    return await operation();
  }

  //=============================================================================
  // Set bearer token
  static Future<void> storeBearerToken(String value) async {
    // Update cache immediately for faster access
    _cache[_bearerTokenKey] = value;
    // Store in background to avoid blocking main thread
    await _runInBackground(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_bearerTokenKey, value);
    });
  }

  // Get bearer token
  static Future<String?> get getBearerToken async {
    // Initialize cache if not already done
    if (!_cacheInitialized) await initializeCache();
    // Return cached value for faster access
    return _cache[_bearerTokenKey] as String?;
  }

  //=============================================================================
  // Set FCM token
  static Future<void> storeFcmToken(String value) async {
    // Update cache immediately for faster access
    _cache[_fcmTokenKey] = value;
    // Store in background to avoid blocking main thread
    await _runInBackground(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_fcmTokenKey, value);
    });
  }

  // Get FCM token
  static Future<String?> get getFcmToken async {
    // Initialize cache if not already done
    if (!_cacheInitialized) await initializeCache();
    // Return cached value for faster access
    return _cache[_fcmTokenKey] as String?;
  }

  //=============================================================================
  // Set user isLogin
  static Future<void> storeLogin(bool value) async {
    // Update cache immediately for faster access
    _cache[_isLoginKey] = value;
    // Store in background to avoid blocking main thread
    await _runInBackground(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoginKey, value);
    });
  }

  // Get user login Status
  static Future<bool?> get getLogin async {
    // Initialize cache if not already done
    if (!_cacheInitialized) await initializeCache();
    // Return cached value for faster access
    return _cache[_isLoginKey] as bool?;
  }

  //=============================================================================
  // Store User Data
  static Future<void> storeUserData(dynamic value) async {
    final jsonString = jsonEncode(value);
    // Update cache immediately for faster access
    _cache[_userDataKey] = jsonString;
    // Store in background to avoid blocking main thread
    await _runInBackground(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userDataKey, jsonString);
    });
  }

  // Get User Data
  /* 
  "Write these lines in codee to get the data from sharedpreference"
  "Here 'UserData' is the model you created from the API Response and it will convert the json to actual UserData"
  final value = await LocalDb.getUserData;
  final userData = UserData.fromJson(value);
  */
  static Future<String?> get getUserData async {
    // Initialize cache if not already done
    if (!_cacheInitialized) await initializeCache();
    // Get cached data and decode if needed
    final myData = _cache[_userDataKey] as String?;
    if (myData != null) {
      try {
        return jsonDecode(myData);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  //=============================================================================
  // Set userid
  static Future<void> storeUserId(int value) async {
    // Update cache immediately for faster access
    _cache[_userIdKey] = value;
    // Store in background to avoid blocking main thread
    await _runInBackground(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_userIdKey, value);
    });
  }

  // Get user ID
  static Future<int?> get getUserId async {
    // Initialize cache if not already done
    if (!_cacheInitialized) await initializeCache();
    // Return cached value for faster access
    return _cache[_userIdKey] as int?;
  }

  //=============================================================================
  // Theme Mode Storage (Optimized for frequent access)
  static Future<void> storeThemeMode(int value) async {
    // Update cache immediately for faster access
    _cache[_themeModeKey] = value;
    // Store in background to avoid blocking UI
    await _runInBackground(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeModeKey, value);
    });
  }

  // Get theme mode
  static Future<int?> get getThemeMode async {
    // Initialize cache if not already done
    if (!_cacheInitialized) await initializeCache();
    // Return cached value for faster access
    return _cache[_themeModeKey] as int?;
  }

  //=============================================================================
  // Cache Management
  static Future<void> clearCache() async {
    _cache.clear();
    _cacheInitialized = false;
  }

  /// Refresh cache from storage (useful after external changes)
  static Future<void> refreshCache() async {
    _cacheInitialized = false;
    await initializeCache();
  }

  // Reset SharedPreference
  static Future<void> get resetSharedPreference async {
    // Clear cache first
    _cache.clear();
    _cacheInitialized = false;
    // Clear storage in background
    await _runInBackground(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    });
  }
}
