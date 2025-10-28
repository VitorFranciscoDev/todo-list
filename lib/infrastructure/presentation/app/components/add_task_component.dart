import 'package:flutter/material.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({ super.key, required this.controller, required this.label });
  final TextEditingController controller;
  final String label;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Task"),
      content: Center(
          child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                  suffixIcon: controller.text.isNotEmpty ? Icon(Icons.clear) : null,
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.lightBlue,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.lightBlue,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.lightBlue,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.lightBlue,
                    width: 2,
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}