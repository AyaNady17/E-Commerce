import 'package:flutter/material.dart';
import 'package:test/Controllers/database_controller.dart';
import 'package:test/Views/screens/cart_page.dart';
import 'package:test/Views/screens/checkout/checkout_page.dart';
import 'package:test/Views/screens/home_page.dart';
import 'package:test/Views/screens/landing_page.dart';
import 'package:test/Views/screens/auth_page.dart';
import 'package:test/Views/screens/navbar_page.dart';
import 'package:test/Views/screens/product_details_screen.dart';
import 'package:test/Views/screens/profile_page.dart';
import 'package:test/model/product_model.dart';

class AppRouter {
  static const String homePage = 'HomePage';
  static const String authPage = 'AuthPage';
  static const String navBarPage = 'NavBarPage';
  static const String landingPage = 'landingPage';
  static const String profilePage = 'profilePage';
  static const String productPage = 'productPage';
  static const String cartPage = "CartPage";
  static const String checkoutPage = "checkoutPage";
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
      case cartPage:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case checkoutPage:
        return MaterialPageRoute(builder: (_) => const CheckoutPage());
      case productPage:
        final args = settings.arguments as Map<String, dynamic>;
        final product = args['product'];
        final database = args['database'];
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
                  productModel: product,
                  dataBase: database,
                ));
    }
  }
}
