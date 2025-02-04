import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompButton extends StatelessWidget{
  Function()? onTap;
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
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.all(16),
        child: Center(child: Text(text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        )),
      )
    );
  }
}