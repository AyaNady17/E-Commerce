import 'package:firebase_auth/firebase_auth.dart';
import 'package:test/utils/cach_helper.dart';

abstract class AuthBase {
  Future<User?> loginUserWithEmailAndPassword(String email, String password);
  Future<User?> createUserWithEmailAndPassword(String email, String password);
  User? get currentUser;
  void authStateChanges();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  void authStateChanges() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        // User is signed out
        print('User is currently signed out!');
        CacheHelper().saveData(key: 'isLoggedIn', value: false);
      } else {
        // User is signed in
        print('User is signed in!');
        CacheHelper().saveData(key: 'isLoggedIn', value: true);
      }
    });
  }

  @override
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  @override
  // TODO: implement currentUser
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }
}
