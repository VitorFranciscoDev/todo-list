import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/repositories/task_repository.dart';

class TaskUseCases {
  // Constructor
  const TaskUseCases({ required this.repository });
  final TaskRepository repository;

  // Validations
  String? validateEmpty(String name, String value) => value.isEmpty ? "$name cannot be blank" : null;

  // Repository
  // Add Task
  Future<int> addTask(Task task) async {
    try {
      return await repository.addTask(task);
    } catch(e) {
      throw Exception("Error in Add Task Task Use Cases: $e");
    }
  }

  // Delete Task
  Future<int> deleteTask(int? id) async {
    try {
      return await repository.deleteTask(id);
    } catch(e) {
      throw Exception("Error in Delete Task Task Use Cases: $e");
    }
  }
  
  // Update Task
  Future<int> updateTask(Task task) async {
    try {
      return await repository.updateTask(task);
    } catch(e) {
      throw Exception("Error in Update Task Task Use Cases: $e");
    }
  }

  // Get All Tasks
  Future<List<Task>> getAllTasks(int uid) async {
    try {
      return await repository.getAllTasks(uid);
    } catch(e) {
      throw Exception("Error in Get All Tasks Task Use Cases: $e");
    }
  }
}