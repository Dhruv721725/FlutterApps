import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompField extends StatelessWidget{
  final TextEditingController controller;
  final bool obscureText;
  final String hintText; 
  dynamic suffix;
   CompField({
    super.key, 
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffix
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontFamily: "rajdhani",
          color: Theme.of(context).colorScheme.inversePrimary
        ),

        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily:"rajdhani" ,
            color: Theme.of(context).colorScheme.secondary
          ),

          filled: true,
          fillColor: Colors.grey.shade700,
          
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 2
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
              width: 2
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}