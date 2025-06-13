import '../database/db_helper.dart';
import '../models/peso_model.dart';

class PesoController {
  Future<int> inserirPeso(Peso peso) async {
    final db = await DBHelper().database;
    return await db.insert('peso', peso.toMap());
  }

  Future<List<Peso>> listarPesosDoPerfil(int idPerfil) async {
    final db = await DBHelper().database;
    final result = await db.query(
      'peso',
      where: 'idPerfil = ?',
      whereArgs: [idPerfil],
      orderBy: 'data DESC',
    );
    return result.map((e) => Peso.fromMap(e)).toList();
  }

  Future<double?> obterUltimoPeso(int idPerfil) async {
    final db = await DBHelper().database;
    final result = await db.query(
      'peso',
      where: 'idPerfil = ?',
      whereArgs: [idPerfil],
      orderBy: 'data DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first['valor'] as double;
    }
    return null;
  }
}
