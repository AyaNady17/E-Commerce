import 'package:flutter/material.dart';
import 'package:test/utils/themes/App%20Colors/app_colors_light.dart';

ThemeData appThemeLight() {
  return ThemeData(
    scaffoldBackgroundColor: AppColorsLight.scaffoldBackgroundColor,
    primaryColor: AppColorsLight.primaryColor,
    iconTheme: const IconThemeData(
      color: AppColorsLight.iconColor,
      size: 24,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style:
            ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red))),
    appBarTheme:
        const AppBarTheme(backgroundColor: AppColorsLight.primaryColor),
    dividerColor: AppColorsLight.dividerColor,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: AppColorsLight.textColor),
      enabledBorder: OutlineInputBorder(
        //borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          )),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
    ),
    textTheme: const TextTheme(
        headlineMedium: TextStyle(color: Colors.black, fontSize: 24),
        bodyLarge: TextStyle(
          color: Colors.grey,
        ),
        titleMedium: TextStyle(color: Colors.black)),
  );
}
