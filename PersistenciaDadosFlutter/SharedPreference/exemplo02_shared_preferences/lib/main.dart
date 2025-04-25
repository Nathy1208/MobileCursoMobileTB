import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Perfil Persistente',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String _favoriteColor = 'Red';
  String _savedName = '', _savedAge = '', _savedColor = 'Red';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('name') ?? '';
      _savedAge = prefs.getString('age') ?? '';
      _savedColor = prefs.getString('color') ?? 'Red';
      _favoriteColor = _savedColor;
    });
  }

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('age', _ageController.text);
    prefs.setString('color', _favoriteColor);
    _loadData();
  }

  Color _getBackgroundColor() {
    switch (_favoriteColor) {
      case 'Red': return Colors.red.shade200;
      case 'Green': return Colors.green.shade200;
      case 'Blue': return Colors.blue.shade200;
      case 'Yellow': return Colors.yellow.shade200;
      default: return Colors.purple.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil Persistente')),
      body: Container(
        color: _getBackgroundColor(),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCard(_nameController, 'Nome'),
              _buildCard(_ageController, 'Idade', isNumber: true),
              _buildColorSelection(),
              _buildSaveButton(),
              if (_savedName.isNotEmpty) _buildSavedDataCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(TextEditingController controller, String label, {bool isNumber = false}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        ),
      ),
    );
  }

  Widget _buildColorSelection() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ['Red', 'Green', 'Blue', 'Yellow', 'Purple'].map((color) {
            return RadioListTile<String>(
              title: Text(color),
              value: color,
              groupValue: _favoriteColor,
              onChanged: (value) => setState(() => _favoriteColor = value!),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _saveData,
          child: Text('Salvar Dados'),
        ),
      ),
    );
  }

  Widget _buildSavedDataCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dados Salvos:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Nome: $_savedName'),
            Text('Idade: $_savedAge'),
            Text('Cor favorita: $_savedColor'),
          ],
        ),
      ),
    );
  }
}
