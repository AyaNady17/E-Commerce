import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Controllers/database_controller.dart';
import 'package:test/Views/screens/auth_page.dart';
import 'package:test/Views/screens/navbar_page.dart';
import 'package:test/services/auth.dart';
import 'package:test/utils/cach_helper.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthBase>(context).authStateChanges();
    if (CacheHelper().getData(key: 'isLoggedIn') == true) {
      return const NavBarPage();
    } else {
      return const AuthPage();
    }
  }
}
