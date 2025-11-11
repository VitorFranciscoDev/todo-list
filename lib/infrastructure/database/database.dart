import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/infrastructure/database/tasks_table.dart';
import 'package:to_do_list/infrastructure/database/users_table.dart';

class ToDoListDatabase {
  static final ToDoListDatabase _instance = ToDoListDatabase._internal();
  factory ToDoListDatabase() => _instance;
  ToDoListDatabase._internal();
  static Database? db;

  Future<Database> get database async {
    if(db != null) return db!;
    db = await _initDatabase();
    return db!;
  }

  Future<Database> _initDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'trip_planner.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await UsersTable.createTable(db);
        await TasksTable.createTable(db);
      },
    );
  }
}