import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/infrastructure/presentation/app/app_global_state.dart';
import 'package:to_do_list/infrastructure/presentation/todo-list/todo_list_state.dart';
import 'package:to_do_list/module/task/task_repository.dart';
import 'package:to_do_list/module/task/task_usecase.dart';

void main() {
  final taskRepository = TaskRepository();
  final taskUseCase = TaskUseCase(taskRepository: taskRepository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ToDoListProvider(taskUseCase: taskUseCase),
      child: const MyApp(),
    ),
  );
}