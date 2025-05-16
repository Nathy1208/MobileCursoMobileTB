import 'package:intl/intl.dart';

class Consulta{
  final int? id; //vai ser gerado pelo BD
  final int petId; //chave estrangeira para o pet
  final DateTime dataHora;
  final String tipoServico;
  final String? observacao; //pode ser nulo, por canta desse ? em frente ao tipo de informação que ele é
  
  //CONSTRUTOR
  Consulta({
    this.id,
    required this.petId,
    required this.dataHora,
    required this.tipoServico,
    this.observacao
  });

  //Converter map: Obj em BD
  Map<String,dynamic> toMap() {
    return {
      "id":id,
      "pet_id": petId,
      "data_hora":dataHora,
      "tipo_servico":tipoServico,
      "observacao":observacao
    };
  }

  //Converter obj: BD => obj
  factory Consulta.fromMap(Map<String,dynamic> map) {
    return Consulta(
      id: map["id"] as int,
      petId: map ["petId"] as int,
      dataHora: DateTime.parse(map["data_hora"]as String),
      tipoServico: ["tipoServico"] as String,
      observacao: map["observacao"] as String
      );
  }

  //Formatação de data e hora em formato Regional
  String get dataHoraFormatada {
    final formatter = DateFormat("dd/mm/yyyy HH:mm");
    return formatter.format(dataHora);
  }

  @override
  String toString() {
    // TODO: implement ==
    return "Consulta{id: $id, petId: $petId, dataHora: $dataHora, Servico: $tipoServico, observacao: $observacao}";
  }

  }