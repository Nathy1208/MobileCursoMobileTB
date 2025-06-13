import 'package:flutter/material.dart';
import '../controllers/perfil_controller.dart';
import '../controllers/peso_controller.dart';
import '../widgets/peso_grafico.dart';
import 'registrar_peso_screen.dart';

class DetalhesPerfilScreen extends StatefulWidget {
  const DetalhesPerfilScreen({super.key});

  @override
  State<DetalhesPerfilScreen> createState() => _DetalhesPerfilScreenState();
}

class _DetalhesPerfilScreenState extends State<DetalhesPerfilScreen> {
  final perfilController = PerfilController();
  final pesoController = PesoController();
  String imcTexto = '';

  @override
  void initState() {
    super.initState();
    calcularIMC();
  }

  Future<void> calcularIMC() async {
    final perfil = await perfilController.obterPerfil();
    if (perfil != null) {
      final ultimoPeso = await pesoController.obterUltimoPeso(perfil.id!);
      if (ultimoPeso != null) {
        final imc = ultimoPeso / (perfil.altura * perfil.altura);
        setState(() {
          imcTexto = imc.toStringAsFixed(2);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: perfilController.obterPerfil(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final perfil = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: const Text('Meu Perfil')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome: ${perfil.nome}',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text('Altura: ${perfil.altura} m',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('Sexo: ${perfil.sexo}',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('Nascimento: ${perfil.dataNascimento}',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 12),
                        Text('IMC Atual: $imcTexto',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: PesoGrafico(idPerfil: perfil.id!),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              RegistrarPesoScreen(idPerfil: perfil.id!),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Registrar Novo Peso'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
