import 'package:flutter/material.dart';
import 'package:to_do_list/entity/task.dart';
import 'package:to_do_list/module/task/task_usecase.dart';

class ToDoListProvider with ChangeNotifier {
  ToDoListProvider({ required this.taskUseCase });

  final TaskUseCase taskUseCase;

  List<Task>? _tasks;
  List<Task>? get tasks => _tasks;

  String? _errorTask;
  String? get errorTask => _errorTask;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool validateTask(String name) {
    _errorTask = taskUseCase.validateName(name);

    return _errorTask == null;
  }

  Future<String?> addTask(Task task) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await taskUseCase.addTask(task);

      if(result > 0) {
        _tasks = await taskUseCase.getAllTasks();
        return null;
      }

      return "Error in Add Task. Try Again.";
    } catch(e) {
      return "Unexpected Error. Try Again.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> deleteTask(int? id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await taskUseCase.deleteTask(id);

      if(result > 0) {
        _tasks = await taskUseCase.getAllTasks();
        return null;
      }
      
      return "Error in Delete Task. Try Again.";
    } catch(e) {
      return "Unexpected Error. Try Again.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> updateTask(Task task) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await taskUseCase.updateTask(task);

      if(result > 0) {
        _tasks = await taskUseCase.getAllTasks();
        return null;
      }
      
      return "Error in Update Task. Try Again.";
    } catch(e) {
      return "Unexpected Error. Try Again.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> getAllTasks(Task task) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await taskUseCase.getAllTasks();

      if(result != null) {
        _tasks = result;
        return null;
      }
      
      return "Error in Get All Tasks. Try Again.";
    } catch(e) {
      return "Unexpected Error. Try Again.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}