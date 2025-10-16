import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nifCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool loading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login - Registro de Ponto')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nifCtrl, decoration: InputDecoration(labelText: 'NIF')),
            TextField(controller: _passCtrl, decoration: InputDecoration(labelText: 'Senha'), obscureText: true),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: loading ? null : () async {
                setState((){ loading = true; error = null; });
                final cred = await auth.signInWithNif(_nifCtrl.text.trim(), _passCtrl.text.trim());
                setState((){ loading = false; });
                if (cred != null) Navigator.pushReplacementNamed(context, '/home');
                else setState((){ error = 'Falha ao autenticar. Verifique NIF/senha.'; });
              },
              child: loading ? CircularProgressIndicator() : Text('Entrar'),
            ),
            if (error != null) Padding(padding: EdgeInsets.only(top:12), child: Text(error!, style: TextStyle(color: Colors.red))),
          ],
        ),
      ),
    );
  }
}
