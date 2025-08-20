import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/utils/app_styles/colors.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';

class AppThemeData {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: const MaterialColor(
        0x306A99,
        AppColors.lightThePrimaryColor,
      ),
      primaryColor: AppColors.azurePrimary,
      scaffoldBackgroundColor: AppColors.whitePrimary,
      cardColor: AppColors.whitePrimary,
      dividerColor: AppColors.whiteShadow,
      shadowColor: AppColors.blackDark.withValues(alpha: 0.1),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whitePrimary,
        foregroundColor: AppColors.blackPrimary,
        elevation: 0,
        systemOverlayStyle: AppColors.whiteStatusBar,
        iconTheme: IconThemeData(color: AppColors.blackPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.blackPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: AppStyle.poppins,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.whitePrimary,
        selectedItemColor: AppColors.azurePrimary,
        unselectedItemColor: AppColors.greyLight,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.whitePrimary,
        elevation: 2,
        shadowColor: AppColors.blackDark.withValues(alpha: 26),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.whiteSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.azurePrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.redPrimary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),

      // Elevated Button Theme
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: AppColors.azurePrimary,
      //     foregroundColor: AppColors.whitePrimary,
      //     elevation: 2,
      //     shadowColor: AppColors.azurePrimary.withValues(alpha: 77),
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      //     textStyle: const TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600,
      //       fontFamily: AppStyle.poppins,
      //     ),
      //   ),
      // ),

      // Text Button Theme
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     foregroundColor: AppColors.azurePrimary,
      //     textStyle: const TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600,
      //       fontFamily: AppStyle.poppins,
      //     ),
      //   ),
      // ),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.blackPrimary, size: 24),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 32,
        ),
        displayMedium: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 28,
        ),
        displaySmall: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 24,
        ),
        headlineLarge: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 22,
        ),
        headlineMedium: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 20,
        ),
        headlineSmall: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 18,
        ),
        titleLarge: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 16,
        ),
        titleMedium: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 14,
        ),
        titleSmall: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 12,
        ),
        bodyLarge: AppStyle.poppinsRegularTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 16,
        ),
        bodyMedium: AppStyle.poppinsRegularTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 14,
        ),
        bodySmall: AppStyle.poppinsRegularTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 12,
        ),
        labelLarge: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 14,
        ),
        labelMedium: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 12,
        ),
        labelSmall: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.blackPrimary,
          fontSize: 10,
        ),
      ),

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.azurePrimary,
        secondary: AppColors.greenPrimary,
        surface: AppColors.whitePrimary,
        error: AppColors.redPrimary,
        onPrimary: AppColors.whitePrimary,
        onSecondary: AppColors.whitePrimary,
        onSurface: AppColors.blackPrimary,
        onError: AppColors.whitePrimary,
      ),

      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      fontFamily: AppStyle.poppins,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: const MaterialColor(
        0x57AD57,
        AppColors.darkThePrimaryColor,
      ),
      primaryColor: AppColors.greenPrimary,
      scaffoldBackgroundColor: AppColors.blackLight,
      cardColor: AppColors.blackSecondary,
      dividerColor: AppColors.blackSecondary,
      shadowColor: AppColors.blackDark.withValues(alpha: 0.3),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blackLight,
        foregroundColor: AppColors.whitePrimary,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.blackLight,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: AppColors.whitePrimary),
        titleTextStyle: TextStyle(
          color: AppColors.whitePrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: AppStyle.poppins,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.blackLight,
        selectedItemColor: AppColors.greenPrimary,
        unselectedItemColor: AppColors.greyLight,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.blackSecondary,
        elevation: 2,
        shadowColor: AppColors.blackDark.withValues(alpha: 77),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.blackSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.greenPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.redPrimary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        labelStyle: const TextStyle(color: AppColors.whitePrimary),
        hintStyle: const TextStyle(color: AppColors.greyLight),
      ),

      // Elevated Button Theme
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: AppColors.greenPrimary,
      //     foregroundColor: AppColors.whitePrimary,
      //     elevation: 2,
      //     shadowColor: AppColors.greenPrimary.withValues(alpha: 77),
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      //     textStyle: const TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600,
      //       fontFamily: AppStyle.poppins,
      //     ),
      //   ),
      // ),

      // Text Button Theme
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     foregroundColor: AppColors.greenPrimary,
      //     textStyle: const TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600,
      //       fontFamily: AppStyle.poppins,
      //     ),
      //   ),
      // ),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.whitePrimary, size: 24),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 32,
        ),
        displayMedium: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 28,
        ),
        displaySmall: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 24,
        ),
        headlineLarge: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 22,
        ),
        headlineMedium: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 20,
        ),
        headlineSmall: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 18,
        ),
        titleLarge: AppStyle.poppinsBoldTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 16,
        ),
        titleMedium: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 14,
        ),
        titleSmall: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 12,
        ),
        bodyLarge: AppStyle.poppinsRegularTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 16,
        ),
        bodyMedium: AppStyle.poppinsRegularTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 14,
        ),
        bodySmall: AppStyle.poppinsRegularTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 12,
        ),
        labelLarge: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 14,
        ),
        labelMedium: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 12,
        ),
        labelSmall: AppStyle.poppinsMediumTextStyle.copyWith(
          color: AppColors.whitePrimary,
          fontSize: 10,
        ),
      ),

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.greenPrimary,
        secondary: AppColors.azurePrimary,
        surface: AppColors.blackLight,
        error: AppColors.redPrimary,
        onPrimary: AppColors.whitePrimary,
        onSecondary: AppColors.whitePrimary,
        onSurface: AppColors.whitePrimary,
        onError: AppColors.whitePrimary,
      ),

      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      fontFamily: AppStyle.poppins,
    );
  }
}
