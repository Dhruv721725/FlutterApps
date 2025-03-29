import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompAuthTextfield extends StatelessWidget{
  TextEditingController controller;
  String hintText;
  bool? obscureText;
  Widget? suffixIcon;

  CompAuthTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 25, vertical: 10), 
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        minLines: 1,
        maxLines: obscureText==true ? 1 : 4,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,

          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            )
          ),

          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
            )
          ) ,

          suffixIcon: suffixIcon,
        ),
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
  }
}