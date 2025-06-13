import 'package:flutter/material.dart';
import '../controllers/peso_controller.dart';
import '../models/peso_model.dart';
import 'package:intl/intl.dart';

class PesoGrafico extends StatelessWidget {
  final int idPerfil;

  const PesoGrafico({super.key, required this.idPerfil});

  @override
  Widget build(BuildContext context) {
    final controller = PesoController();

    return FutureBuilder<List<Peso>>(
      future: controller.listarPesosDoPerfil(idPerfil),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final pesos = snapshot.data!;
        if (pesos.isEmpty) {
          return const Center(child: Text('Nenhum peso registrado ainda.'));
        }

        return ListView.separated(
          itemCount: pesos.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, i) {
            final peso = pesos[i];
            return ListTile(
              leading: const Icon(Icons.monitor_weight, color: Colors.green),
              title: Text('${peso.valor} kg',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                DateFormat('dd/MM/yyyy').format(
                  peso.data is DateTime
                      ? peso.data as DateTime
                      : DateTime.parse(peso.data.toString()),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        );
      },
    );
  }
}
