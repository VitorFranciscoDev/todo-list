import 'package:to_do_list/entity/task.dart';
import 'package:to_do_list/module/task/task_spec.dart';

class TaskUseCase {
  TaskUseCase({ required this.taskRepository });

  final ITaskRepository taskRepository;

  Future<int> addTask(Task task) async {
    try {
      return await taskRepository.addTask(task);
    } catch(e) {
      throw Exception("Error in Add Task Use Case: $e");
    }
  }

  Future<int> deleteTask(int? id) async {
    try {
      return await taskRepository.deleteTask(id!);
    } catch(e) {
      throw Exception("Error in Delete Task Use Case: $e");
    }
  }

  Future<int> updateTask(Task task) async {
    try {
      return await taskRepository.updateTask(task);
    } catch(e) {
      throw Exception("Error in Update Task Use Case: $e");
    }
  }

  Future<List<Task>?> getAllTasks() async {
    try {
      return await taskRepository.getAllTasks();
    } catch(e) {
      throw Exception("Error in Get All Tasks Use Case: $e");
    }
  }
}