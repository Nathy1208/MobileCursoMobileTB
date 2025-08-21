import 'package:biblioteca_app/models/user_model.dart';
import 'package:biblioteca_app/services/api_services.dart';

class UserControler {

  //métodos
  // GET dos Usuários
  Future<List<UserModel>> fetchAll() async{
    final list = await ApiService.getList("users?_sort=name");
    //retorna lista convertida de users para o UserModels 
    return list.map<UserModel>((item)=>UserModel.fromJson(item)).toList();
  }

  // POST -> Criar novo usuário
  Future<UserModel> create(UserModel u) async{
    final created  = await ApiService.post("users", u.toJson());
    //adiciona um user e retorn p user criado -> id
    return UserModel.fromJson(created);
  }

  //Get -> buscar um user
  Future<UserModel> fetchOne(String id) async{
    final user = await ApiService.getOne("user", id);
    //retorna o usuario encontrado no banco de dados
    return UserModel.fromJson(user);
  }

  //put -> atualizar usuário
  Future<UserModel> update(UserModel u) async{
    final update = await ApiService.put("user", u.toJson(), u.id!);
    //retorna user atualizado
    return UserModel.fromJson(update);
  }

  Future<void> delete(String id) async{
    await ApiService.delete("users", id);
    //no return, pois foi deletado
  }

}