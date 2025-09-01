import 'package:flutter/material.dart';

class ToDoContainer extends StatelessWidget{
  ToDoContainer({Key? key, required this.task, required this.taskCompleted, required this.onChanged, required this.onDelete}) : super(key: key);
  final String task;
  final bool taskCompleted;
  
  final Function(bool?)? onChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
            ),
            Expanded(
              child: Text(task),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      )
    );
  }
}