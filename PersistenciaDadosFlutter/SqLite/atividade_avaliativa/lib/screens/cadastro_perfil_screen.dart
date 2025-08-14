import 'package:atividade_avaliativa/screens/detalhes_perfil_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controllers/perfil_controller.dart';
import '../models/perfil_model.dart';

// Certifique-se de que o arquivo home_screen.dart define uma classe chamada HomeScreen

class CadastroPerfilScreen extends StatefulWidget {
  const CadastroPerfilScreen({super.key});

  @override
  State<CadastroPerfilScreen> createState() => _CadastroPerfilScreenState();
}

class _CadastroPerfilScreenState extends State<CadastroPerfilScreen> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final alturaController = TextEditingController();
  final sexoController = TextEditingController();
  final dataNascimentoController = TextEditingController();
  final perfilController = PerfilController();

  Future<void> _selecionarData() async {
    DateTime? selecionada = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    setState(() {
      dataNascimentoController.text = DateFormat('dd/MM/yyyy').format(selecionada);
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Perfil'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome', prefixIcon: Icon(Icons.person)),
                  validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Altura (m)', prefixIcon: Icon(Icons.height)),
                  validator: (value) =>
                      double.tryParse(value ?? '') == null ? 'Altura inválida' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: sexoController,
                  decoration: const InputDecoration(labelText: 'Sexo', prefixIcon: Icon(Icons.wc)),
                  validator: (value) => value!.isEmpty ? 'Informe o sexo' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: dataNascimentoController,
                  readOnly: true,
                  onTap: _selecionarData,
                  decoration: const InputDecoration(labelText: 'Data de Nascimento', prefixIcon: Icon(Icons.calendar_today)),
                  validator: (value) => value!.isEmpty ? 'Informe a data' : null,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar e Voltar'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final perfil = Perfil(
                          nome: nomeController.text,
                          altura: double.parse(alturaController.text),
                          sexo: sexoController.text,
                          dataNascimento: dataNascimentoController.text,
                        );
                        await perfilController.inserirPerfil(perfil);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const DetalhesPerfilScreen ()),
                          (route) => false,
                        );
                      }
                    },
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
