import 'package:flutter/material.dart';
import 'package:test/Views/screens/landing_page.dart';
import 'package:test/Views/screens/auth_page.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case 'AuthPage':
        return MaterialPageRoute(builder: (_) => const AuthPage());
    }
  }
}
