import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditItem extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Function() onSave;
  const EditItem({
    super.key,
    required this.title,
    required this.controller,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Row(children: [Icon(Icons.edit),Text(title)],),
      content:TextField(
        maxLines: 3,
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        decoration: InputDecoration(
          hint: Text("Enter your text..."),
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
            borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
            borderRadius: BorderRadius.circular(12)
          ),
          
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: onSave, 
          child: Text("Save")
        ),
        ElevatedButton(
          onPressed: ()=>Navigator.pop(context), 
          child: Text("Cancel")
        )
      ],
    );
  }
}