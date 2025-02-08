import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompTextfield extends StatelessWidget{
  TextEditingController controller;
  bool obscureText;
  String hintText;
  CompTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.tertiary,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          ), 
        ),
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary
        ),
      ),
    );  
  }
}