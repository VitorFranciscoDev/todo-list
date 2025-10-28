import 'package:to_do_list/entity/task.dart';
import 'package:to_do_list/infrastructure/database/database.dart';
import 'package:to_do_list/module/task/task_spec.dart';

class TaskRepository implements ITaskRepository {
  final database = ToDoListDatabase();

  @override
  Future<int> addTask(Task task) async {
    final db = await database.database;

    try {
      return await db.insert('tasks', task.toMap());
    } catch(e) {
      throw Exception("Error in Add Task Repository: $e");
    }
  }

  @override
  Future<int> deleteTask(int? id) async {
    final db = await database.database;

    try {
      return await db.delete(
        'tasks', 
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch(e) {
      throw Exception("Error in Delete Task Repository: $e");
    }
  }

  @override
  Future<int> updateTask(Task task) async {
    final db = await database.database;

    try {
      return await db.update(
        'tasks', 
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch(e) {
      throw Exception("Error in Update Task Repository: $e");
    }
  }

  @override
  Future<List<Task>?> getAllTasks() async {
    final db = await database.database;

    try {
      final result = await db.query('tasks');
      return result.map((t) => Task.fromMap(t)).toList();
    } catch(e) {
      throw Exception("Error in Get All Trips Repository: $e");
    }
  }
}