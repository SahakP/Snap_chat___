import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class DatabaseHendler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE users(userName TEXT PRIMARY KEY AUTOINCREMENT, firstName TEXT NOT NULL,  lastName TEXT NOT NULL, password TEXT NOT NULL, email TEXT, phoneNumber TEXT , birthday TEXT NOT NULL)',
        );
      },
      version: 1,
    );
  }

  Future<int> insertUser(List<User> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('users', user.toMap());
    }
    return result;
  }

  Future<List<User>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  Future<void> deleteUser(String userName) async {
    final db = await initializeDB();
    await db.delete(
      'users',
      where: 'userName = ?',
      whereArgs: [userName],
    );
  }
}
