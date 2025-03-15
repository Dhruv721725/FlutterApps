import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompPromptTile extends StatelessWidget{
  String text;
  CompPromptTile({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(56, 8, 8, 8),
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.fromLTRB(0,8,16,0), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
        ),       
        child: Text(text, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
      ),
    );
  }
}