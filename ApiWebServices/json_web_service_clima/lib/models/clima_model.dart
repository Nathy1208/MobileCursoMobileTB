class ClimaModel {
    //atributos
    final String cidade;
    final double temperatura;
    final String descricao;

    //construtor
    ClimaModel({
        required this.cidade,
        required this.temperatura,
        required this.descricao,
    });

    //toJson e (FromJson)
    //neste caso apenas usamos o ToJson pois não enviamos nada para a API

    factory ClimaModel.fromJson(Map<String,dynamic> json){
        return ClimaModel(
            cidade: json["name"], //pega o nome da cidade
            temperatura: json["main"]["temp"].toDouble(),//pega temperatura
            descricao: json["weather"][0]["description"]);//descrição do clima
    }

}