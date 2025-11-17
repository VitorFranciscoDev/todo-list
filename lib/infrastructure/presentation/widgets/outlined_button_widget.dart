import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({ super.key, required this.function, required this.message1, required this.message2 });
  final VoidCallback function;
  final String message1;
  final String message2;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => function(),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: BorderSide(
          color: Colors.grey[300]!,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message1,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
          ),
          Text(
            message2,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}