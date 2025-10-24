import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import '../controllers/point_controller.dart';
import '../services/biometric_service.dart';

class RegisterPointScreen extends StatefulWidget {
  const RegisterPointScreen({super.key});

  @override
  _RegisterPointScreenState createState() => _RegisterPointScreenState();
}

class _RegisterPointScreenState extends State<RegisterPointScreen> {
  final biometric = BiometricService();
  bool authBiometric = false;
  bool saving = false;
  String status = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context, listen: false);
    final point = Provider.of<PointController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Ponto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Última distância: ${point.lastDistance?.toStringAsFixed(1) ?? "—"} m',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),

            // Botão de autenticação biométrica
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  saving = true;
                  status = 'Autenticando biometria...';
                });

                final ok = await biometric.authenticate();

                setState(() {
                  saving = false;
                  authBiometric = ok;
                  status = ok ? 'Biometria OK' : 'Biometria falhou';
                });
              },
              child: const Text('Autenticar com Biometria'),
            ),

            const SizedBox(height: 12),

            // Botão de registro de ponto
            ElevatedButton(
              onPressed: (!point.insideRadius || saving)
                  ? null
                  : () async {
                      setState(() {
                        saving = true;
                        status = 'Registrando...';
                      });

                      try {
                        await point.checkDistance(-23.5489, -46.6388);

                        await point.savePoint(
                          auth.user?.uid ?? 'anonymous',
                          -23.5489,
                          -46.6388,
                          point.lastDistance ?? 0.0,
                          authBiometric ? 'biometria' : 'NIF',
                        );

                        setState(() {
                          status = 'Ponto registrado com sucesso';
                        });
                      } catch (e) {
                        setState(() {
                          status = 'Erro ao registrar: $e';
                        });
                      }

                      setState(() {
                        saving = false;
                      });
                    },
              child: saving
                  ? const CircularProgressIndicator()
                  : const Text('Confirmar registro'),
            ),

            const SizedBox(height: 12),

            Text(
              status,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
