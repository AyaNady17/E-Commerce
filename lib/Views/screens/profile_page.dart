import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Controllers/auth_controller.dart';
import 'package:test/Views/widgets/main_button.dart';
import 'package:test/services/auth.dart';
import 'package:test/utils/app_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  void _logOut(BuildContext context) {
    Provider.of<AuthController>(context, listen: false).logOut();
    Navigator.of(context, rootNavigator: true).pushNamed(AppRouter.authPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
              child: MainButton(
                title: 'Log Out',
                onTap: () {
                  _logOut(context);
                },
              ),
            ),
          ]),
    );
  }
}
