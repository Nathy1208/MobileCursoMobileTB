import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Container com ícone de pessoa no centro
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Texto sobre o usuário
              Center(
                child: Text(
                  'Lazuly Perene',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Brasil, SP',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(height: 30),

              // 3 Containers com texto dentro
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildInfoContainer('Texto 1'),
                  _buildInfoContainer('Texto 2'),
                  _buildInfoContainer('Texto 3'),
                ],
              ),
              SizedBox(height: 30),

              // Lista de ícones e textos abaixo dos containers com separadores
              Column(
                children: <Widget>[
                  _buildListTile(Icons.email, 'Email'),
                  Divider(),
                  _buildListTile(Icons.phone, 'Telefone'),
                  Divider(),
                  _buildListTile(Icons.location_on, 'Endereço'),
                ],
              ),
            ],
          ),
        ),
      ),

      // BottomNavigationBar com ícones de redes sociais
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.facebook),
            label: 'Facebook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuário',
          ),
        ],
        onTap: (index) {
          // Ação quando um item for clicado
          print('Ícone ${index + 1} clicado');
        },
      ),
    );
  }

  // Função para criar containers de informação
  Widget _buildInfoContainer(String text) {
    return Container(
      height: 80,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Função para criar ListTile com ícone e texto
  Widget _buildListTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
    );
  }
}

