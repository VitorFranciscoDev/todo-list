import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/entity/task.dart';
import 'package:to_do_list/infrastructure/presentation/app/components/add_task_component.dart';
import 'package:to_do_list/infrastructure/presentation/app/components/alert_dialog_component.dart';
import 'package:to_do_list/infrastructure/presentation/todo-list/todo_list_state.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<ToDoListProvider>();

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text(
                "To Do List",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 320,
                  height: 600,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                ),
              ),
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
            error: provider.errorTask,
            cancel: () => Navigator.of(context).pop(),
            add: () async {
              final isValid = provider.validateTask(_controller.text);

              if(!isValid) return;

              Task task = Task(name: _controller.text, concluded: false);

              final result = await provider.addTask(task);

              if(result == null) {
                Navigator.of(context).pop();
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialogComponent(
                    title: "Task Created Succesfully", 
                    fn2: () => Navigator.of(context).pop(), 
                    fn2Message: "Ok",
                  ),
                );
              } else {
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialogComponent(
                    title: result, 
                    fn2: () => Navigator.of(context).pop(), 
                    fn2Message: "Ok",
                  ),
                );
              }
            },
          ),
        ),
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}