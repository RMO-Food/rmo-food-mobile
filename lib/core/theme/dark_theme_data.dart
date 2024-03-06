import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';

class DarkThemeData {
  static Color labelColor = Colors.white;

  static TextStyle labelLarge = TextStyle(
      fontFamily: fontFamily, color: labelColor, fontSize: fontSizeLarge);
  static TextStyle labelMedium = TextStyle(
      fontFamily: fontFamily, color: labelColor, fontSize: fontSizeMedium);
  static TextStyle labelSmall = TextStyle(
      fontFamily: fontFamily, color: labelColor, fontSize: fontSizeSmall);

  static ThemeData themeData() {
    return ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(centerTitle: true, titleTextStyle: labelLarge),
        textTheme: TextTheme(
            titleLarge: labelLarge,
            titleMedium: labelMedium,
            titleSmall: labelSmall,
            headlineLarge: labelLarge,
            headlineMedium: labelMedium,
            headlineSmall: labelSmall,
            displayLarge: labelLarge,
            displayMedium: labelMedium,
            displaySmall: labelSmall,
            bodyLarge: labelLarge,
            bodyMedium: labelMedium,
            bodySmall: labelSmall),
        primaryColor: primaryColor);
  }
}
