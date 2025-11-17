import 'package:flutter/widgets.dart';
import 'package:to_do_list/domain/entities/task.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  
}