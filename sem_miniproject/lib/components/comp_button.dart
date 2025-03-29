import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompButton extends StatelessWidget{
  Function() onTap;
  String text;

  CompButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        padding: EdgeInsets.all(16),

        width: double.maxFinite,

        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),

        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black
          ),  
        ),
      ),
    );
  }
}