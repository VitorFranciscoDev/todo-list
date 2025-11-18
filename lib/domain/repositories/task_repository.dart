import 'package:to_do_list/domain/entities/task.dart';

// Task Contracts
abstract class TaskRepository {
  Future<int> addTask(Task task);
  Future<int> deleteTask(int? id);
  Future<int> updateTask(Task task);
  Future<List<Task>> getAllTasks(int uid);
}