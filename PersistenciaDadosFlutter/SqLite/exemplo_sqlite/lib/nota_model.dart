class Nota{
  //atributos
  final int? id; // permite seja nula 
  final String titulo;
  final String conteudo;

  // construtor 
  Nota({this.id, required this.titulo, required this.conteudo});

  // métodos Map // Factory ==> tradução entre banco de dados e objeto

  //converte um objeto da classe Nota para um Map (para inserir no Banco de Dados)
  Map<String,dynamic> toMap(){
    return{
      "id":id, //id é nulo (null)
      "titulo":titulo,
      "conteudo":conteudo
    };
  }

  //Converte um Map(vindo do Banco de Dados) para Objeto em Classe Nota
  factory Nota.fromMap(Map<String,dynamic> map){
    return Nota(
      id: map["id"] as int,
      titulo: map["titulo"] as String,
      conteudo: map["conteudo"] as String
    );
  }

  //método para imprimir os dados
  String toString(){
    return 'Nota{id:$id, título:$titulo, conteudo:$conteudo}';
    
  }
}