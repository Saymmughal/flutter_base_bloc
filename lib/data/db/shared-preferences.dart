// ignore_for_file: file_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static const String _bearerTokenKey = "BearerToken";
  static const String _isLoginKey = "isLogin";
  static const String _userDatalKey = "userData";
  static const String _fcmTokenKey = "fcmToken";

  //=============================================================================
  // Set bearer token
  static Future<void> storeBearerToken(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store bearer token in shared preferences
    sharedPreferences.setString(_bearerTokenKey, value);
  }

  // Get bearer token
  static Future<String?> get getBearerToken async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = sharedPreferences.getString(_bearerTokenKey);
    return bearerToken;
  }

  //=============================================================================
  // Set FCM token
  static Future<void> storeFcmToken(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store fcm token in shared preferences
    sharedPreferences.setString(_fcmTokenKey, value);
  }

  // Get bearer token
  static Future<String?> get getFcmToken async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the fcm token which we have stored in sharedPreferences before
    String? fcmToken = sharedPreferences.getString(_fcmTokenKey);
    return fcmToken;
  }

  //=============================================================================
  // Set user isLogin
  static Future<void> storeLogin(bool value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store user isLoginin shared preferences
    sharedPreferences.setBool(_isLoginKey, value);
  }

  // Get user login Status
  static Future<bool?> get getLogin async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the user isLoginwhich we have stored in sharedPreferences before
    bool? isLogin = sharedPreferences.getBool(_isLoginKey);
    return isLogin;
  }

  //=============================================================================
  // Store User Data
  static Future<void> storeUserData(dynamic value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store User Data in shared preferences
    sharedPreferences.setString(_userDatalKey, jsonEncode(value));
  }

  // Get User Data
  /* 
  "Write these lines in codee to get the data from sharedpreference"
  "Here 'UserData' is the model you created from the API Response and it will convert the json to actual UserData"
  final value = await LocalDb.getUserData;
  final userData = UserData.fromJson(value);
  */
  static Future<String?> get getUserData async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the User Data which we have stored in sharedPreferences before
    var myData = sharedPreferences.getString(_userDatalKey);
    dynamic token;
    if (myData != null) {
      token = jsonDecode(myData);
    }
    return token;
  }

  // Reset SharedPreference
  static Future<void> get resetSharedPreference async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
