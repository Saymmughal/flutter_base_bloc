import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/env_configuration/env_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoadEnvFile {
  /// Loads the environment variables from the .env file.
  static Future<void> load() async {
    // Load environment variables
    try {
      // Try to load from assets first (for production builds)
      await dotenv.load(fileName: ".env");
    } catch (e) {
      try {
        // Fallback: try to load from root directory (for development)
        await dotenv.load(fileName: ".env", mergeWith: {});
      } catch (e2) {
        debugPrint('Warning: Could not load .env file. Using default values.');
        debugPrint('Error 1: $e');
        debugPrint('Error 2: $e2');
        // Continue with default values
      }
    }

    // Validate environment configuration
    if (!EnvConfig.isValid) {
      debugPrint('❌ Environment configuration errors:');
      for (final error in EnvConfig.validationErrors) {
        debugPrint('   - $error');
      }
      debugPrint('Please check your .env file configuration.');
      // Don't return, continue with default values for development
    }

    debugPrint(' Environment loaded successfully:');
    debugPrint('   - Environment: ${EnvConfig.environment}');
    debugPrint('   - Full Login URL: ${EnvConfig.fullLoginUrl}');
    debugPrint('   - .env Loaded: ${EnvConfig.isEnvLoaded}');
    debugPrint('   - Configuration Valid: ${EnvConfig.isValid}');

    // Set development defaults if .env file was not loaded
    EnvConfig.setDevelopmentDefaults();
  }
}
