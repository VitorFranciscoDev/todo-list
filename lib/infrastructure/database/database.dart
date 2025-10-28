import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/infrastructure/database/task_table.dart';

class ToDoListDatabase {
  // Instances of DB
  static final ToDoListDatabase _instance = ToDoListDatabase._internal();
  factory ToDoListDatabase() => _instance;
  ToDoListDatabase._internal();
  static Database? db;

  // Getter of DB
  Future<Database> get database async {
    if(db != null) return db!;
    db = await _initDB();
    return db!;
  }

  // Initializes the DB
  Future<Database> _initDB() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'todo_list.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await TaskTable.createTable(db);
      },
    );
  }
}