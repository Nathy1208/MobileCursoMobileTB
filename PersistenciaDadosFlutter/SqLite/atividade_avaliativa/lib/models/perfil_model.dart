class Perfil {
  int? id;
  String nome;
  double altura;
  String sexo;
  String dataNascimento;

  Perfil({
    this.id,
    required this.nome,
    required this.altura,
    required this.sexo,
    required this.dataNascimento,
  });

  factory Perfil.fromMap(Map<String, dynamic> map) {
    return Perfil(
      id: map['id'],
      nome: map['nome'],
      altura: map['altura'],
      sexo: map['sexo'],
      dataNascimento: map['dataNascimento'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'altura': altura,
      'sexo': sexo,
      'dataNascimento': dataNascimento,
    };
  }
}
