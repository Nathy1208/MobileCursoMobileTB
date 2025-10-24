import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder: in production list Firestore points
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Pontos')),
      body: Center(child: Text('Aqui será exibido o histórico (Firestore).')),
    );
  }
}
