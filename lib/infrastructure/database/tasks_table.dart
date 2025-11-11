import 'package:sqflite/sqlite_api.dart';

class TasksTable {
  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        uid INTEGER NOT NULL,
        color TEXT NOT NULL,
        title TEXT NOT NULL,
        desc TEXT NOT NULL,
        startTime TEXT,
        endTime TEXT,
        local TEXT,
        priority INTEGER NOT NULL,
        FOREIGN KEY(uid) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');
  }
}