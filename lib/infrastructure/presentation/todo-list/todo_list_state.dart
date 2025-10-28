import 'package:flutter/material.dart';
import 'package:to_do_list/entity/task.dart';

class ToDoListProvider with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  String? _errorTask;
  String? get errorTask => _errorTask;

  
}