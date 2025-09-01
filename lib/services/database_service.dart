import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._internal();
  DatabaseService._internal();
  static Database? _db;
  
  //Getter
  Future<Database> get database async {
    if(_db!=null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  //Initializes the SQLite database
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  //Creates the table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        taskName TEXT NOT NULL,
        taskCompleted INTEGER NOT NULL
      )
    ''');
  }

  //Add the task in the database
  Future<int> insertTask(String taskName, bool taskCompleted) async {
    final db = await database;
    return await db.insert('tasks', {
      'taskName': taskName,
      'taskCompleted': taskCompleted ? 1 : 0,
    });
  }

  //Show the tasks
  Future<List<Map<String, dynamic>>> showTasks() async {
    final db = await database;
    return await db.query('tasks');
  }

  //Update the task in the database
  Future<int> updateTask(int id, bool taskCompleted) async {
    final db = await database;
    return await db.update(
      'tasks',
      {'taskCompleted': taskCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Delete the task in the database
  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}