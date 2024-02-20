import 'package:flutter/material.dart';
import 'package:test/utils/themes/App%20Colors/app_colors_dark.dart';

ThemeData appThemeDark() {
  return ThemeData(
    cardColor: AppColorsDark.secondaryColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColorsDark.secondaryColor),
    scaffoldBackgroundColor: AppColorsDark.scaffoldBackgroundColor,
    primaryColor: AppColorsDark.primaryColor,
    iconTheme: const IconThemeData(
      color: AppColorsDark.iconColor,
      size: 24,
    ),
    // appBarTheme:
    //     const AppBarTheme(backgroundColor: AppColorsDark.primaryColor),
    dividerColor: AppColorsDark.dividerColor,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: AppColorsDark.TextColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
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
        headlineMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(
          color: Colors.grey,
        ),
        titleMedium: TextStyle(color: Colors.white)),
  );
}
