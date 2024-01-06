import 'package:flutter/material.dart';
import 'package:test/utils/app_router.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: 'AuthPage',
    );
  }
}

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xf9f9f9f9),
    primaryColor: Colors.red,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
    ),
  );
}
