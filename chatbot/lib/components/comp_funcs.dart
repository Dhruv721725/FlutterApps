import 'package:flutter/material.dart';

class CompFuncs {
  void warning(String text, BuildContext context){
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        content: Text(text, textAlign: TextAlign.center,),
      )
    );
  }
}