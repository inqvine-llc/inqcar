import 'package:flutter/material.dart';
import 'package:inqcar/services/linux_service.dart';

class AppTheme {
  final Color colorBackground;
  final Color colorSurfaceLight;
  final Color colorSurfaceDark;
  final Color colorAccent;
  final Color colorText;
  final Color colorTextSecondary;

  final List<Color> greyPalette;

  final double paddingLarge;
  final double paddingMedium;
  final double paddingSmall;
  final double paddingXSmall;
  final double paddingNone;

  final double borderRadiusSmall;
  final double borderRadiusMedium;
  final double borderRadiusLarge;

  final BoxShadow defaultShadow;
  final BoxShadow neumorphicHighlight;

  final TextTheme textTheme;

  const AppTheme({
    required this.colorBackground,
    required this.colorSurfaceLight,
    required this.colorSurfaceDark,
    required this.colorAccent,
    required this.colorText,
    required this.colorTextSecondary,
    required this.greyPalette,
    this.paddingLarge = 20.0,
    this.paddingMedium = 15.0,
    this.paddingSmall = 10.0,
    this.paddingXSmall = 5.0,
    this.paddingNone = 0.0,
    this.borderRadiusSmall = 8.0,
    this.borderRadiusMedium = 12.0,
    this.borderRadiusLarge = 16.0,
    required this.defaultShadow,
    required this.neumorphicHighlight,
    required this.textTheme,
  });

  static AppTheme get current {
    final LinuxService linuxService = LinuxService.getInstance();

    String theme = linuxService.currentProfileSettings?.theme ?? 'light';
    switch (theme) {
      case 'dark':
        return dark;
      case 'light':
      default:
        return light;
    }
  }

  static const AppTheme light = AppTheme(
    colorBackground: Color(0xFFE0E5EC),
    colorSurfaceLight: Color(0xFFF0F5FA),
    colorSurfaceDark: Color(0xFFD1D9E6),
    colorAccent: Color(0xFF4A90E2),
    colorText: Color(0xFF212121),
    colorTextSecondary: Color(0xFF757575),
    greyPalette: [
      Color(0xFFFAFAFA), // 50
      Color(0xFFF5F5F5), // 100
      Color(0xFFEEEEEE), // 200
      Color(0xFFE0E0E0), // 300
      Color(0xFFD6D6D6), // 350
      Color(0xFFBDBDBD), // 400
      Color(0xFF9E9E9E), // 500
      Color(0xFF757575), // 600
      Color(0xFF616161), // 700
      Color(0xFF424242), // 800
      Color(0xFF212121), // 900
    ],
    defaultShadow: BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
    neumorphicHighlight: BoxShadow(
      color: Colors.white,
      offset: Offset(-4, -4),
      blurRadius: 8,
      spreadRadius: 1,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 48,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.25,
        height: 1.12,
        color: Color(0xFF212121),
      ),
      displayMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 40,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.16,
        color: Color(0xFF212121),
      ),
      displaySmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 32,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        height: 1.22,
        color: Color(0xFF212121),
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.25,
        color: Color(0xFF212121),
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.29,
        color: Color(0xFF212121),
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.33,
        color: Color(0xFF212121),
      ),
      titleLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.27,
        color: Color(0xFF212121),
      ),
      titleMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.50,
        color: Color(0xFF212121),
      ),
      titleSmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
        color: Color(0xFF212121),
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.50,
        color: Color(0xFF212121),
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
        color: Color(0xFF212121),
      ),
      bodySmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
        color: Color(0xFF212121),
      ),
      labelLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: Color(0xFF212121),
      ),
      labelMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: Color(0xFF212121),
      ),
      labelSmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: Color(0xFF212121),
      ),
    ),
  );

  static const AppTheme dark = AppTheme(
    colorBackground: Color(0xFF121212),
    colorSurfaceLight: Color(0xFF1E1E1E),
    colorSurfaceDark: Color(0xFF2C2C2C),
    colorAccent: Color(0xFF64B5F6),
    colorText: Color(0xFFE0E0E0),
    colorTextSecondary: Color(0xFFBDBDBD),
    greyPalette: [
      Color(0xFF212121), // 900
      Color(0xFF424242), // 800
      Color(0xFF616161), // 700
      Color(0xFF757575), // 600
      Color(0xFF9E9E9E), // 500
      Color(0xFFBDBDBD), // 400
      Color(0xFFD6D6D6), // 350
      Color(0xFFE0E0E0), // 300
      Color(0xFFEEEEEE), // 200
      Color(0xFFF5F5F5), // 100
      Color(0xFFFAFAFA), // 50
    ],
    defaultShadow: BoxShadow(
      color: Color(0x66000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
    neumorphicHighlight: BoxShadow(
      color: Color(0xFF2C2C2C),
      offset: Offset(-4, -4),
      blurRadius: 8,
      spreadRadius: 1,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 48,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.25,
        height: 1.12,
        color: Color(0xFFE0E0E0),
      ),
      displayMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 40,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.16,
        color: Color(0xFFE0E0E0),
      ),
      displaySmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 32,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        height: 1.22,
        color: Color(0xFFE0E0E0),
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.25,
        color: Color(0xFFE0E0E0),
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.29,
        color: Color(0xFFE0E0E0),
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.33,
        color: Color(0xFFE0E0E0),
      ),
      titleLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.27,
        color: Color(0xFFE0E0E0),
      ),
      titleMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.50,
        color: Color(0xFFE0E0E0),
      ),
      titleSmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
        color: Color(0xFFE0E0E0),
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.50,
        color: Color(0xFFE0E0E0),
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
        color: Color(0xFFE0E0E0),
      ),
      bodySmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
        color: Color(0xFFE0E0E0),
      ),
      labelLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: Color(0xFFE0E0E0),
      ),
      labelMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: Color(0xFFE0E0E0),
      ),
      labelSmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: Color(0xFFE0E0E0),
      ),
    ),
  );

  ThemeData toThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: colorBackground,
      colorScheme: ColorScheme(
        brightness: colorBackground.computeLuminance() > 0.5 ? Brightness.light : Brightness.dark,
        primary: colorAccent,
        secondary: colorAccent,
        background: colorBackground,
        surface: colorSurfaceLight,
        onBackground: colorText,
        onSurface: colorText,
        onPrimary: colorBackground,
        onSecondary: colorBackground,
        error: Colors.red,
        onError: colorBackground,
      ),
      textTheme: textTheme,
      iconTheme: IconThemeData(color: colorText),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorSurfaceLight,
          foregroundColor: colorText,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMedium),
          ),
          padding: EdgeInsets.symmetric(horizontal: paddingMedium, vertical: paddingSmall),
        ),
      ),
      cardTheme: CardTheme(
        color: colorSurfaceLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
        ),
      ),
    );
  }
}
