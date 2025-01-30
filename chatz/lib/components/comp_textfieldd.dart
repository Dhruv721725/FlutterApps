import 'package:flutter/material.dart';

class CompTextfield extends StatelessWidget{
  final TextEditingController controller;
  final String hintText;
  final bool pass;
  const CompTextfield({super.key, required this.controller, required this.pass, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: pass,
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,),
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );
  }
}