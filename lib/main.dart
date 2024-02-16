import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Controllers/database_controller.dart';
import 'package:test/firebase_options.dart';
import 'package:test/services/auth.dart';
import 'package:test/utils/app_router.dart';
import 'package:test/utils/cach_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper().init();
  runApp(MultiProvider(providers: [
    Provider<AuthBase>(
      create: (context) => Auth(),
    ),
    Provider<DataBase>(
      create: (context) => DataBaseController(userId: Auth().currentUser!.uid),
    )
  ], child: const TestApp()));
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
      initialRoute: AppRouter.navBarPage,
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
  );
}
