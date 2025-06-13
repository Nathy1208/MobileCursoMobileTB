import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controllers/peso_controller.dart';
import '../models/peso_model.dart';

class RegistrarPesoScreen extends StatefulWidget {
  final int idPerfil;

  const RegistrarPesoScreen({super.key, required this.idPerfil});

  @override
  State<RegistrarPesoScreen> createState() => _RegistrarPesoScreenState();
}

class _RegistrarPesoScreenState extends State<RegistrarPesoScreen> {
  final _formKey = GlobalKey<FormState>();
  final valorController = TextEditingController();
  final dataController = TextEditingController();
  final pesoController = PesoController();

  Future<void> _selecionarData() async {
    DateTime? selecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (selecionada != null) {
      setState(() {
        dataController.text = DateFormat('dd/MM/yyyy').format(selecionada);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Peso')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: valorController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Peso (kg)',
                      prefixIcon: Icon(Icons.monitor_weight),
                    ),
                    validator: (value) {
                      final peso = double.tryParse(value ?? '');
                      if (peso == null || peso <= 0) return 'Peso inválido';
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: dataController,
                    readOnly: true,
                    onTap: _selecionarData,
                    decoration: const InputDecoration(
                      labelText: 'Data da Medição',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Informe a data' : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final peso = Peso(
                            idPerfil: widget.idPerfil,
                            valor: valorController.text,
                            data: dataController.text,
                          );
                          await pesoController.inserirPeso(peso);
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Salvar Peso'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
