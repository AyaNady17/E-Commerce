// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:test/services/auth.dart';
import 'package:test/utils/enums.dart';

class AuthController with ChangeNotifier {
  String email;
  String password;
  AuthType authType;
  final AuthBase authBase;
  AuthController({
    this.email = " ",
    this.password = " ",
    this.authType = AuthType.login,
    required this.authBase,
  });

  Future<void> submit() async {
    try {
      if (authType == AuthType.register) {
        await authBase.createUserWithEmailAndPassword(email, password);
      } else {
        await authBase.loginUserWithEmailAndPassword(email, password);
      }
    } on Exception {
      rethrow;
    }
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
