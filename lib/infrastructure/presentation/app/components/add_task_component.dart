import 'package:flutter/material.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({ super.key, required this.controller, required this.hint, this.error, required this.cancel, required this.add });
  final TextEditingController controller;
  final String hint;
  final String? error;
  final VoidCallback cancel;
  final VoidCallback add;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: theme.colorScheme.primary,
      title: Text("Add Task", style: TextStyle(color: theme.colorScheme.background)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              errorText: error,
              suffixIcon: controller.text.isNotEmpty 
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => controller.clear(), 
                  ) 
                : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: theme.colorScheme.background,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: theme.colorScheme.background,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: theme.colorScheme.background,
                  width: 2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: theme.colorScheme.background,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => cancel(), 
                child: Text("Cancel", style: TextStyle(color: theme.colorScheme.background)),
              ),
              TextButton(
                onPressed: () => add(), 
                child: Text("Add", style: TextStyle(color: theme.colorScheme.background)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}