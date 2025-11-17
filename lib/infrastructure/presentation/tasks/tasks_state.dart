import 'package:flutter/widgets.dart';
import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/usecases/task_usecases.dart';

class TasksProvider with ChangeNotifier {
  // Constructor
  TasksProvider({ required this.useCases });
  final TaskUseCases useCases;

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  
}