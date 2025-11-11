import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/repositories/task_repository.dart';
import 'package:to_do_list/infrastructure/database/database.dart';

class SQLiteTaskRepository implements TaskRepository {
  final database = ToDoListDatabase();

  @override
  Future<int> addTask(Task task) async {
    try {
      final db = await database.database;

      return await db.insert('tasks', task.toMap());
    } catch(e) {
      throw Exception("Error in Add Task SQLite Task Repository: $e");
    }
  }

  @override
  Future<int> deleteTask(int? id) async {
    try {
      final db = await database.database;

      return await db.delete(
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch(e) {
      throw Exception("Error in Delete Task SQLite Task Repository");
    }
  }

  @override
  Future<int> updateTask(Task task) async {
    try {
      final db = await database.database;

      return await db.update(
        'tasks', 
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch(e) {
      throw Exception("Error in Update Task SQLite Task Repository");
    }
  }

  @override
  Future<List<Task>> getAllTasks(int? uid) async {
    try {
      final db = await database.database;

      final tasks = await db.query(
        'tasks',
        where: 'id = ?',
        whereArgs: [uid],
      );

      return tasks.map((task) => Task.fromMap(task)).toList();
    } catch(e) {
      throw Exception("Error in Get All Tasks SQLite Task Repository");
    }
  }
}