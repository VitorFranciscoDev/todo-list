import 'package:to_do_list/entity/task.dart';

abstract class ITaskRepository {
  Future<int> addTask(Task task);
  Future<int> deleteTask(int? id);
  Future<int> updateTask(Task task);
  Future<List<Task>> getAllTasks();
}