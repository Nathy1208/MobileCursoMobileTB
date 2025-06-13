import '../database/db_helper.dart';
import '../models/perfil_model.dart';

class PerfilController {
  Future<int> inserirPerfil(Perfil perfil) async {
    final db = await DBHelper().database;
    return await db.insert('perfil', perfil.toMap());
  }

  Future<Perfil?> obterPerfil() async {
    final db = await DBHelper().database;
    final result = await db.query('perfil', limit: 1);
    if (result.isNotEmpty) {
      return Perfil.fromMap(result.first);
    }
    return null;
  }
}
