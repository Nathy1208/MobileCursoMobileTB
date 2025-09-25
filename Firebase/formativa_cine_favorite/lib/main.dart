import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:formativa_cine_favorite/views/cine_favorite.dart';
import 'package:formativa_cine_favorite/views/cine_login.dart';

void main() async{ //Async -> Conect com Firebase
//garanto o carregamento dos Widgets antes de conectar com o firebase
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

//Listener para direconar a navegação da tela inicial
class AuthStream extends StatelessWidget{
  const AuthStream({super.key});

  @override
  Widget build(BuildContext context) {
    //verificar se o usuário já esta logado ou não
    return StreamBuilder<User?>(
      // o listener esta na mudança de status do usuário
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          return FavoriteView();
        }
        return CineLogin();
      });
  }
}