import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:formativa_cine_favorite/views/cine_favorite.dart';
import 'package:formativa_cine_favorite/views/cine_login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "CineFavorite",
    theme: ThemeData(
      primaryColor: Colors.deepOrange,
      brightness: Brightness.dark
    ),
    home: AuthStream(),
  ));
}

class AuthStream extends StatelessWidget{
  const AuthStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          return CineFavorite();
        }
        return CineLogin();
      });
  }
}