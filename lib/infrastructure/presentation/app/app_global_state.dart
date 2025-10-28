import 'package:flutter/material.dart';
import 'package:to_do_list/infrastructure/presentation/app/theme/theme.dart';
import 'package:to_do_list/infrastructure/presentation/todo-list/todo_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoListScreen(),
      theme: lightTheme,
    );
  }
}