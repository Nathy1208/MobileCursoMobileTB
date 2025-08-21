import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_web_service_clima/models/clima_model.dart';

class ClimaController{
    final String _apiKey = "284008892302ad72eedc9bf4e1a7bee8"; //chave da API

    //método get
    Future<ClimaModel?> getClima(String cidade) async{
        final url = Uri.parse(
            "http://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$_apiKey&units=metric&lang=pt_br"
        );

        final response = await http.get(url);
        if(response.statusCode ==200){
            final dados = json.decode(response.body);
            return ClimaModel.fromJson(dados);
        }else{
            return null;
        }
    }
}