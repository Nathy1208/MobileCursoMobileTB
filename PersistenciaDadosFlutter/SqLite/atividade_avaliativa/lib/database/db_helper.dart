import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._();
  static Database? _database;

  DBHelper._();

  factory DBHelper() => _instance;

  Future<Database> get database async {
    _database ??= await _initDB('imc_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE perfil (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        altura REAL,
        sexo TEXT,
        dataNascimento TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE peso (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        idPerfil INTEGER,
        valor REAL,
        data TEXT,
        FOREIGN KEY (idPerfil) REFERENCES perfil(id)
      )
    ''');
  }
}
