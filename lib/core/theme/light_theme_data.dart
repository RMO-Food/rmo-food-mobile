import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';

class LightThemeData {
  static Color labelColor = Colors.black87;

  static ThemeData themeData() {
    return ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeLarge)),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeLarge),
            headlineMedium: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeMedium),
            headlineSmall: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeSmall),
            displayLarge: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeLarge),
            displayMedium: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeMedium),
            displaySmall: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeSmall),
            bodyLarge: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeLarge),
            bodyMedium: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeMedium),
            bodySmall: TextStyle(
                fontFamily: fontFamily,
                color: labelColor,
                fontSize: fontSizeSmall)),
        primaryColor: primaryColor);
  }
}
