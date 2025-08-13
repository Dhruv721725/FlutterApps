import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompTextfield extends StatelessWidget{

  TextEditingController controller;
  String hintText;
  bool obscureText;
  Widget? suffix;

  CompTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffix
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText:obscureText,  

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary
        ),

        enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(
            color: Theme.of(context).colorScheme.inversePrimary,
            width: 2
           ),
           borderRadius: BorderRadius.circular(16),
        ),

        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
            width: 2
           ),
           borderRadius: BorderRadius.circular(16),
        ),

        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,

        suffixIcon: suffix,
      ),
    );
  }
}