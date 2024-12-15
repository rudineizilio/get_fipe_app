import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trabalho_pos_flutter/src/features/login/models/user_model.dart';

class LoginDatabaseHelper {
  static final LoginDatabaseHelper instance = LoginDatabaseHelper._init();

  static Database? _database;

  LoginDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user_db.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            cpf TEXT PRIMARY KEY,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(User user) async {
    final db = await instance.database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User?> getUser(String cpf) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'cpf = ?',
      whereArgs: [cpf],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<bool> validateUser(User user) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'cpf = ? AND password = ?',
      whereArgs: [user.cpf, user.password],
    );
    return result.isNotEmpty;
  }
}
