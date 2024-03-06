import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';

class LightThemeData {
  static Color labelColor = Colors.black87;

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
      fillColor: Colors.grey.shade200,
      filled: true,
      border: inputBorder);

  static ThemeData themeData() {
    return ThemeData.light().copyWith(
        buttonTheme: const ButtonThemeData(
            buttonColor: Colors.black,
            highlightColor: Colors.red,
            splashColor: Colors.red,
            height: 200),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ButtonStyle(
        //       shape: ,
        //         textStyle: MaterialStateTextStyle.resolveWith(
        //             (states) => labelMedium.copyWith(color: Colors.white)),
        //         backgroundColor:
        //             MaterialStateColor.resolveWith((states) => primaryColor))),
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
