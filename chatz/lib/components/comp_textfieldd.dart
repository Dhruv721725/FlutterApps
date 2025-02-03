import 'package:chatz/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompTextfield extends StatelessWidget{
  final TextEditingController controller;
  final String hintText;
  final bool pass;
  final FocusNode? focusNode;
  
  const CompTextfield({
    super.key, 
    required this.controller, 
    required this.pass, 
    required this.hintText,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark=Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        obscureText: pass,
        style: TextStyle(
          color: isDark?Colors.white:Colors.black
        ),
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