import 'package:sqflite/sqflite.dart';

class TaskTable {
  static createTable(Database db) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        concluded INTEGER NOT NULL
      )
    ''');
  }
}