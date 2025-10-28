import 'package:flutter/material.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent({
    super.key,
    this.icon,
    required this.title,
    required this.fn2,
    required this.fn2Message,
    this.isDanger = false,
  });

  final IconData? icon;
  final String title;
  final VoidCallback fn2;
  final String fn2Message;
  final bool? isDanger;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          if (icon != null) ... [
            Icon(
              icon,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 10),
          ],
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.background,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => fn2(),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.background,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            fn2Message,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}