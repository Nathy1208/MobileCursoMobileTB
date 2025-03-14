import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //build visual
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo Widget Exibição")),
        body: Center(
          child: Column(
            children: [
              Text(
                "um texto qualquer",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Image.network("https://static-00.iconduck.com/assets.00/flutter-icon-512x512-k9y8x41t.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover),

                Image.asset("assets/img/albert.webp",
                width: 200,
                height: 200,
                fit: BoxFit.cover),

                Icon(Icons.star,
                size: 100,
                color: Colors.amber,)

            ],
          ),
        ),
      ),
    );
  }
}
