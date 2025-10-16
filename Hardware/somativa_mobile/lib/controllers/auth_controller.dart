import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  AuthController() {
    user = _auth.currentUser;
    _auth.authStateChanges().listen((u) {
      user = u;
      notifyListeners();
    });
  }

  Future<UserCredential?> signInWithNif(String nif, String password) async {
    try {
      final email = '\$nif@empresa.local';
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      user = cred.user;
      notifyListeners();
      return cred;
    } catch (e) {
      print('Auth error: \$e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
