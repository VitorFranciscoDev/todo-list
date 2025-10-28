import 'package:flutter/material.dart';
import 'package:to_do_list/infrastructure/presentation/app/components/add_task_component.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text("To Do List"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context, 
          builder: (context) => AddTaskComponent(
            controller: _controller,
            label: "Name",
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}