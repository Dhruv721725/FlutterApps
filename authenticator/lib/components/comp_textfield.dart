import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompTextfield extends StatelessWidget{

  final controller;
  final String hintText;
  final bool obscureText;

  CompTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
          ),
          filled: true,
          fillColor: Colors.grey[100],
          hintText: hintText,
        ),

        controller: controller,

        obscureText: obscureText,
      ),
    );
  }
}