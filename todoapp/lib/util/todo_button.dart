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
      child: Text(text,style: TextStyle(color:Colors.white70),),
      color: Colors.purpleAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      );
  }
}