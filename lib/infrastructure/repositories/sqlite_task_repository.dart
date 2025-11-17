import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/repositories/task_repository.dart';
import 'package:to_do_list/infrastructure/database/database.dart';

// Task Repository Implementation
class SQLiteTaskRepository implements TaskRepository {
  final database = ToDoListDatabase();

  // Add Task in DB
  @override
  Future<int> addTask(Task task) async {
    try {
      final db = await database.database;

      // Return the Index of new Task
      return await db.insert('tasks', task.toMap());
    } catch(e) {
      throw Exception("Error in Add Task SQLite Task Repository: $e");
    }
  }

  // Delete Task from DB
  @override
  Future<int> deleteTask(int? id) async {
    try {
      final db = await database.database;

      // Return the Number of Rows Affected
      return await db.delete(
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch(e) {
      throw Exception("Error in Delete Task SQLite Task Repository: $e");
    }
  }

  // Update Task in DB
  @override
  Future<int> updateTask(Task task) async {
    try {
      final db = await database.database;

      // Return the Number of Rows Affected
      return await db.update(
        'tasks', 
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch(e) {
      throw Exception("Error in Update Task SQLite Task Repository: $e");
    }
  }

  // Query in DB [UID]
  @override
  Future<List<Task>> getAllTasks(int? uid) async {
    try {
      final db = await database.database;

      final tasks = await db.query(
        'tasks',
        where: 'id = ?',
        whereArgs: [uid],
      );

      // Return All User's Tasks
      return tasks.map((task) => Task.fromMap(task)).toList();
    } catch(e) {
      throw Exception("Error in Get All Tasks SQLite Task Repository: $e");
    }
  }
}