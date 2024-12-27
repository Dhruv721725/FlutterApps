import 'package:flutter/material.dart';
import 'package:todoapp/util/todo_button.dart';

class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({required this.controller,required this.onSave, required this.onCancel, super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange,
      content: Container(
        height: 120,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.orangeAccent,
                border: OutlineInputBorder(),
                hintText: "Enter todo...",
              ),
              controller: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TodoButton(text: "Save", onPressed:onSave),
                TodoButton(text: "Cancel", onPressed:onCancel)
              ],
            )
          ],
        ),
      ),
    ); 
  }
}