import 'package:flutter/material.dart';
import '../util/todo_container.dart';
import '../util/dialog_box.dart';
import '../services/database_service.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({Key? key}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<Map<String, dynamic>> toDoList = []; //List of tasks
  final TextEditingController _controller = TextEditingController();

  //Initializes the state
  void initState() {
    super.initState();
    _loadTasks();
  }

  //Load the tasks
  Future<void> _loadTasks() async {
    final tasks = await DatabaseService.instance.showTasks();
    setState(() {
      toDoList = tasks;
    });
  }

  //Changes the checkbox
  void checkBoxChanged(bool? value, int index) async {
    final task = toDoList[index];
    final status = !(task['taskCompleted'] == 1);
    await DatabaseService.instance.updateTask(task['id'], status);
    _loadTasks();
  }

  //Saves the task
  void saveTask() async {
    if(_controller.text.trim().isNotEmpty) {
      await DatabaseService.instance.insertTask(_controller.text.trim(), false);
      _loadTasks();
    }
    _controller.clear();
    Navigator.pop(context);
  }

  //Creates a new task
  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () {
            _controller.clear();
            Navigator.pop(context);
          },
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("To Do List"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoContainer(
            task: toDoList[index]['taskName'],
            taskCompleted: toDoList[index]['taskCompleted'] == 1,
            onChanged: (value) => checkBoxChanged(value, index),
            onDelete: () async {
              await DatabaseService.instance.deleteTask(toDoList[index]['id']);
              _loadTasks();
            },
          );
        }
      ),
    );
  }
}