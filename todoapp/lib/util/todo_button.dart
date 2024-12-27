import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  TodoButton({required this.text, required this.onPressed, super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Colors.orangeAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      );
  }
}