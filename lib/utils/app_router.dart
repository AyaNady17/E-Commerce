import 'package:flutter/material.dart';
import 'package:test/Views/screens/home_page.dart';
import 'package:test/Views/screens/landing_page.dart';
import 'package:test/Views/screens/auth_page.dart';
import 'package:test/Views/screens/navbar_page.dart';
import 'package:test/Views/screens/profile_page.dart';

class AppRouter {
  static const String homePage = 'HomePage';
  static const String authPage = 'AuthPage';
  static const String navBarPage = 'NavBarPage';
  static const String landingPage = 'landingPage';
  static const String profilePage = 'profilePage';
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case authPage:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case navBarPage:
        return MaterialPageRoute(builder: (_) => const NavBarPage());
      case landingPage:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
    }
  }
}
