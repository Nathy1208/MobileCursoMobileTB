import 'package:atividade_avaliativa/screens/cadastro_perfil_screen.dart';
import 'package:flutter/material.dart';
// import 'screens/cadastro_perfil_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CadastroPerfilScreen(),
    );
  }
}
