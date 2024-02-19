import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Controllers/database_controller.dart';
import 'package:test/firebase_options.dart';
import 'package:test/services/auth.dart';
import 'package:test/utils/app_router.dart';
import 'package:test/utils/cach_helper.dart';
import 'package:test/utils/constants.dart';
import 'package:test/utils/themes/darktheme.dart';
import 'package:test/utils/themes/lightheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper().init();
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: appThemeLight(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouter.landingPage,
      ),
    );
  }
}
