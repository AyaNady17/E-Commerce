// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:test/Controllers/database_controller.dart';
import 'package:test/model/user_data.dart';

import 'package:test/services/auth.dart';
import 'package:test/utils/cach_helper.dart';
import 'package:test/utils/constants.dart';
import 'package:test/utils/enums.dart';

class AuthController with ChangeNotifier {
  String email;
  String password;
  AuthType authType;
  final AuthBase authBase;
  //!what the diff between these user id in auth controller & user model & database controller
  //DataBase dataBase = DataBaseController(authBase.currentUser.uid);
  AuthController({
    this.email = " ",
    this.password = " ",
    this.authType = AuthType.login,
    required this.authBase,
  });

  Future<void> submit() async {
    try {
      if (authType == AuthType.register) {
        final user =
            await authBase.createUserWithEmailAndPassword(email, password);
        final generatedId = documentIdFromLocalData();
        DataBaseController(user?.uid ?? generatedId)
            .setUserData(UserData(email: email, uid: user?.uid ?? generatedId));
        print("registered user id :${user?.uid ?? generatedId}");
        CacheHelper.sharedPreferences
            .setString('uid', user?.uid ?? generatedId);
      } else {
        await authBase.loginUserWithEmailAndPassword(email, password);
      }
    } on Exception {
      rethrow;
    }
  }

  Future<void> logOut() async {
    await authBase.logOut();
  }

  void updateEmail(String email) {
    copyWith(email: email);
  }

  void updatePassword(String password) {
    copyWith(password: password);
  }

  void copyWith({
    String? email,
    String? password,
    AuthType? authType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authType = authType ?? this.authType;
    notifyListeners();
  }

  void toggleAuthFormType(AuthType authType) {
    if (this.authType == AuthType.login) {
      this.authType = AuthType.register;
    } else {
      this.authType = AuthType.login;
    }
    copyWith(email: '', password: '', authType: this.authType);
  }
}
