import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CineFavorite extends StatefulWidget {
  const CineFavorite({super.key});

  @override
  State<CineFavorite> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<CineFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmes Favoritos"),
        actions: [
          IconButton(
            onPressed: FirebaseAuth.instance.signOut, 
            icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}