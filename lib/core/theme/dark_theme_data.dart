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

  static OutlineInputBorder get inputBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.circular(2));
  static InputDecorationTheme inputDecrationTheme = InputDecorationTheme(
      floatingLabelStyle: labelMedium,
      counterStyle: labelMedium,
      labelStyle: labelMedium.copyWith(color: Colors.grey),
      hintStyle:
          labelMedium.copyWith(color: Colors.grey, fontWeight: FontWeight.w100),
      focusedErrorBorder: inputBorder,
      contentPadding: const EdgeInsets.all(14),
      enabledBorder: inputBorder,
      errorBorder: inputBorder,
      disabledBorder: inputBorder,
      focusedBorder: inputBorder,
      filled: true,
      border: inputBorder);

  static ThemeData themeData() {
    return ThemeData.dark().copyWith(
        listTileTheme: ListTileThemeData(
            titleTextStyle: labelMedium.copyWith(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
                fontSize: 13),
            subtitleTextStyle:
                labelMedium.copyWith(fontSize: 11, color: Colors.grey)),
        inputDecorationTheme: inputDecrationTheme,
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
