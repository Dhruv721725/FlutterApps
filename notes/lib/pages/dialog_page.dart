import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget{

  TextEditingController controller;
  Function() onSave;
  DialogPage({required this.controller, required this.onSave, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "note...",
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface
          )
        ),
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      actions: [
        MaterialButton(
          onPressed:(){
            onSave();
            Navigator.of(context).pop();
            controller.value=TextEditingValue.empty;
          }, 
          child: Text(
            "Save",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                // fontWeight: FontWeight.bold,
              ),
            ),
        ),
        MaterialButton(
          onPressed:(){
            Navigator.of(context).pop();
          }, 
          child: Text(
            "Cancel",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
          ),
        )
      ],
    );
  }
}