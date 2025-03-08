import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompTile extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
   return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10)
      ),
      height: 48,
    ),
  ); 
  }
}