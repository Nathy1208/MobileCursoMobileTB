import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget {
  //lista de imagens
  final List<String> imagens = [
      'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
      'https://images.unsplash.com/photo-1521747116042-5a810fda9664',
      'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
      'https://images.unsplash.com/photo-1518837695005-2083093ee35b',
      'https://cdn.pixabay.com/photo/2023/11/13/14/04/forbidden-city-8385647_640.png',
      'https://img.freepik.com/fotos-premium/paisagens-majestosas-com-castelos-e-cachoeiras-paisagem-de-fantasia_1302896-1263.jpg?semt=ais_hybrid',
      'https://media.istockphoto.com/id/522961501/pt/foto/paisagem-de-fazenda-picturesque-fenced-em-sunrise.jpg?s=612x612&w=0&k=20&c=xJVRkVJs-CBJs36awU-DxjjTyUBO9pJE8XkVsuLtXJE=',
      'https://images.unsplash.com/photo-1506619216599-9d16d0903dfd',
      'https://images.unsplash.com/photo-1494172961521-33799ddd43a5',
      'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galeria de Imagens"),),
      body: Padding(padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: CarouselSlider(
              options: CarouselOptions(height: 300, autoPlay: true),
              items: imagens.map((url){
                return Container(
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(url,fit: BoxFit.cover,width: 1000,),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded( //expande o tamanho da tela, ou seja, permite a rolagem da tela
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8
                ),
                itemCount: imagens.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () => _mostrarImagem(context,imagens[index]),
                    child: Image.network( imagens[index],
                    fit: BoxFit.cover,
                   )
                  );      
                }) 
            )
        ],
      ),),
    );
  }
}
void _mostrarImagem(BuildContext context, String url){
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Image.network(url),
    ));
}