import 'package:flutter/material.dart';

const double kPaddingLarge = 20.0;
const double kPaddingMedium = 15.0;
const double kPaddingSmall = 10.0;
const double kPaddingXSmall = 5.0;
const double kPaddingNone = 0.0;

const double kBorderRadiusSmall = 8.0;
const double kBorderRadiusMedium = 12.0;
const double kBorderRadiusLarge = 16.0;

const Color kColorBackground = Color(0xFFE0E5EC);
const Color kColorSurfaceLight = Color(0xFFF0F5FA);
const Color kColorSurfaceDark = Color(0xFFD1D9E6);
const Color kColorAccent = Color(0xFF4A90E2);

const Color kColorGrey50 = Color(0xFFFAFAFA);
const Color kColorGrey100 = Color(0xFFF5F5F5);
const Color kColorGrey200 = Color(0xFFEEEEEE);
const Color kColorGrey300 = Color(0xFFE0E0E0);
const Color kColorGrey350 = Color(0xFFD6D6D6);
const Color kColorGrey400 = Color(0xFFBDBDBD);
const Color kColorGrey500 = Color(0xFF9E9E9E);
const Color kColorGrey600 = Color(0xFF757575);
const Color kColorGrey700 = Color(0xFF616161);
const Color kColorGrey800 = Color(0xFF424242);
const Color kColorGrey900 = Color(0xFF212121);

// Sizes
const double kAppBarIconSize = 24.0;
const double kAppStatusBarIconSize = 14.0;
const double kAppIconSize = 42.0;
const double kCollapsedHeight = 62.0;
const double kTitleBarHeight = 42.0;

// Animation Durations
const Duration kDrawerAnimationDuration = Duration(milliseconds: 300);

// Shadows
const BoxShadow kDefaultShadow = BoxShadow(
  color: Color(0x1A000000),
  offset: Offset(0, 2),
  blurRadius: 4,
  spreadRadius: 0,
);

const BoxShadow kNeumorphicHighlight = BoxShadow(
  color: Colors.white,
  offset: Offset(-4, -4),
  blurRadius: 8,
  spreadRadius: 1,
);

// Typography
const TextTheme kTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 48,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.25,
    height: 1.12,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 40,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 32,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.22,
  ),
  headlineLarge: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.33,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.27,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.50,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Manrope',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  ),
);

final ThemeData kThemeData = ThemeData(
  scaffoldBackgroundColor: kColorBackground,
  colorScheme: const ColorScheme.light(
    primary: kColorAccent,
    secondary: kColorAccent,
    surface: kColorSurfaceLight,
  ),
  textTheme: kTextTheme,
  iconTheme: const IconThemeData(color: kColorGrey800),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorSurfaceLight,
      foregroundColor: kColorGrey800,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusMedium),
      ),
      padding: const EdgeInsets.symmetric(horizontal: kPaddingMedium, vertical: kPaddingSmall),
    ),
  ),
  cardTheme: CardTheme(
    color: kColorSurfaceLight,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusMedium),
    ),
  ),
);
