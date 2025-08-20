import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment configuration class that loads values from .env file
/// This class provides type-safe access to environment variables
class EnvConfig {
  static const String _baseUrlKey = 'API_BASE_URL';
  static const String _loginUrlKey = 'API_LOGIN_URL';
  static const String _forgotPasswordUrlKey = 'API_FORGOT_PASSWORD_URL';
  static const String _registerUrlKey = 'API_REGISTER_URL';
  static const String _environmentKey = 'ENVIRONMENT';

  /// Base URL for the API
  static String get _baseUrl =>
      dotenv.env[_baseUrlKey] ?? 'https://api.example.com';

  //===================================================================>
  /// Login URL endpoint
  static String get _loginUrl => dotenv.env[_loginUrlKey] ?? '/auth/login';
  /// Forgot Password URL endpoint
  static String get _forgotPasswordUrl => dotenv.env[_forgotPasswordUrlKey] ?? '/auth/forgot-password';
  /// Register URL endpoint
  static String get _registerUrl => dotenv.env[_registerUrlKey] ?? '/auth/register';

  //===================================================================>
  /// Full login URL (base + endpoint)
  static String get fullLoginUrl => '$_baseUrl$_loginUrl';
  /// Full forgot password URL (base + endpoint)
  static String get fullForgotPasswordUrl => '$_baseUrl$_forgotPasswordUrl';
  /// Full register URL (base + endpoint)
  static String get fullRegisterUrl => '$_baseUrl$_registerUrl';







  
  //===================================================================>
  /// Current environment (development, staging, production)
  static String get environment => dotenv.env[_environmentKey] ?? 'development';

  /// Check if running in development mode
  static bool get isDevelopment => environment == 'development';

  /// Check if running in production mode
  static bool get isProduction => environment == 'production';

  /// Check if running in staging mode
  static bool get isStaging => environment == 'staging';

  //===================================================================>
  /// Get API timeout (can be added to .env file)
  static int get apiTimeout {
    final timeout = dotenv.env['API_TIMEOUT'];
    return timeout != null ? int.tryParse(timeout) ?? 30000 : 30000;
  }

  /// Get API version (can be added to .env file)
  static String get apiVersion => dotenv.env['API_VERSION'] ?? 'v1';

  /// Check if .env file was loaded successfully
  static bool get isEnvLoaded => dotenv.env.isNotEmpty;

  /// Validate that required environment variables are set
  static bool get isValid {
    // If .env file is not loaded, use fallback values
    if (!isEnvLoaded) {
      return true; // Allow fallback values for development
    }
    return _baseUrl.isNotEmpty && _loginUrl.isNotEmpty && _forgotPasswordUrl.isNotEmpty && _registerUrl.isNotEmpty; 
  }

  //===================================================================>
  /// Get validation errors if any
  static List<String> get validationErrors {
    final errors = <String>[];

    if (_baseUrl.isEmpty) {
      errors.add('API_BASE_URL is not set in .env file');
    }

    if (_loginUrl.isEmpty) {
      errors.add('API_LOGIN_URL is not set in .env file');
    }

    if (_forgotPasswordUrl.isEmpty) {
      errors.add('API_FORGOT_PASSWORD_URL is not set in .env file');
    }

    if (_registerUrl.isEmpty) {
      errors.add('API_REGISTER_URL is not set in .env file');
    }

    return errors;
  }

  //===================================================================>
  /// Get debug information about environment loading
  static Map<String, dynamic> get debugInfo {
    return {
      'isEnvLoaded': isEnvLoaded,
      'baseUrl': _baseUrl,
      'loginUrl': _loginUrl,
      'fullLoginUrl': fullLoginUrl,
      'forgotPasswordUrl': _forgotPasswordUrl,
      'fullForgotPasswordUrl': fullForgotPasswordUrl,
      'registerUrl': _registerUrl,
      'fullRegisterUrl': fullRegisterUrl,
      'environment': environment,
      'isValid': isValid,
      'validationErrors': validationErrors,
    };
  }

  /// Set default development values when .env file is not available
  static void setDevelopmentDefaults() {
    if (!isEnvLoaded) {
      debugPrint('🔧 Setting development default values');
      // This is a fallback for development when .env file is not available
      // In production, these should come from the .env file
    }
  }
}
