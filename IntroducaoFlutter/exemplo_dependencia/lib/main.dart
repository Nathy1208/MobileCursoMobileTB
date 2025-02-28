import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  //metodo principal para roder aplicação
  runApp(MyApp()); // constrtutor da classe prin
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Material App - contém os widgets Android
      home: Scaffold(
        // tela de vizualização básica
        appBar: AppBar(title: Text("Exemplo de Dependência")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Olá Mundo!!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
              );
            },
            child: Text("Clique Aqui"),
          ),
        ),
      ),
    );
  }
}
