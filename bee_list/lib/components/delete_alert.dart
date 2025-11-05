import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeleteAlert extends StatelessWidget {
  final String message;
  final Function()? onDelete;
  DeleteAlert({
    super.key,
    required this.message,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: onDelete, 
          child: Text("Yes")
        ),
        ElevatedButton(
          onPressed: ()=>Navigator.pop(context), 
          child: Text("No")
        )
      ],
    );
  }
}