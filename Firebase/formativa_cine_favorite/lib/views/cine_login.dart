import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formativa_cine_favorite/views/cine_registro.dart';

class CineLogin extends StatefulWidget {
  const CineLogin({super.key});

  @override
  State<CineLogin> createState() => _CineLoginState();
}

class _CineLoginState extends State<CineLogin> {
  //atributos
  final _emailField = TextEditingController();
  final _senhaField = TextEditingController();
  final _authController = FirebaseAuth.instance; //controller para manipulação do usuário no firebase auth
  bool _senhaOculta = true;

  //método
  void _login() async {
    try {
      //solicitar a autenticação do usuário
      await _authController.signInWithEmailAndPassword(
        email: _emailField.text.trim(),
        password: _senhaField.text,
      );
      //não precisa do Navigator, pois usaremso o StreamBuilder
      // já faz o direcionamento automático para a tela de tarefas
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Falha ao Fazer Login $e")));
    }
  }

  //build da Tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailField,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _senhaField,
              decoration: InputDecoration(
                labelText: "Senha",
                suffix: IconButton(
                  onPressed: () => setState(() {
                    _senhaOculta =
                        !_senhaOculta; //inverte o valor da variável booleana
                  }),
                  icon: _senhaOculta
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              ),
              obscureText: _senhaOculta,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text("Login")),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CineRegistro()),
              ),
              child: Text("Não tem uma conta? Registre-se"),
            ),
          ],
        ),
      ),
    );
  }
}