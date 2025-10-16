import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import '../controllers/point_controller.dart';

class HomeScreen extends StatelessWidget {
  final double workplaceLat = -23.5489; // exemplo: ajustar em settings
  final double workplaceLng = -46.6388;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);
    final point = Provider.of<PointController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo'),
        actions: [
          IconButton(icon: Icon(Icons.history), onPressed: () => Navigator.pushNamed(context, '/history')),
          IconButton(icon: Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, '/settings')),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Usuário: ${auth.user?.uid ?? '—'}"),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => point.checkDistance(workplaceLat, workplaceLng),
              child: Text('Verificar distância até o local de trabalho'),
            ),
            SizedBox(height: 12),
            Text('Última distância: \${point.lastDistance != null ? point.lastDistance!.toStringAsFixed(1) + " m" : "—"}'),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.edit_location),
              label: Text('Registrar Ponto'),
              onPressed: point.insideRadius ? () => Navigator.pushNamed(context, '/register') : null,
            ),
          ],
        ),
      ),
    );
  }
}
