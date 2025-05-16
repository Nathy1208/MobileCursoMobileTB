import 'package:flutter/material.dart';
import 'package:sa1petshop/controllers/pets_controller.dart';
import 'package:sa1petshop/models/pet_model.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final PetsController _petsController = PetsController();

  List<Pet> _pets = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();    
    _loadPets();
  }

  Future<void> _loadPets() async{
    setState(() {
      _isLoading = true;
    });
    try {
        _pets = await _petsController.fetchPets();
    } catch (erro) { //pega o erro do sistema 
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Exception: $erro")));
    }finally{ //execução obrigatória
      setState(() {
        _isLoading = false;
      });
    }
  } 

  @override //buildar a tela
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meus Pets")),
      body: _isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: _pets.length,
        itemBuilder: (context,index){
          final pet = _pets[index];
          return ListTile(
            title: Text(pet.nome),
            subtitle: Text(pet.raca),
            onTap: () async {
              //navegação para a página de detalhe do pet

            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            //Página de Cadastro de novo pet
          })
          );
  }
}