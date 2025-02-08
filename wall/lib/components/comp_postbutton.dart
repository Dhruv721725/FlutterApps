import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompPostbutton extends StatelessWidget{
  final onTap;
  CompPostbutton({
    super.key,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius:BorderRadius.circular(10), 
        ),
        child: Icon(Icons.check, size: 26, color: Theme.of(context).colorScheme.tertiary,),
      ) ,
    );
  }
}