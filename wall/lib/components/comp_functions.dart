import 'package:flutter/material.dart';
  
void warning(String text, context){
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Text(text, textAlign: TextAlign.center,),
    ));
  }