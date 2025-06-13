class Peso {
  int? id;
  int idPerfil;
  String valor;
  String data;

  Peso({
    this.id,
    required this.idPerfil,
    required this.valor,
    required this.data,
  });

  factory Peso.fromMap(Map<String, dynamic> map) {
    return Peso(
      id: map['id'],
      idPerfil: map['idPerfil'],
      valor: map['valor'],
      data: map['data'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idPerfil': idPerfil,
      'valor': valor,
      'data': data,
    };
  }
}
