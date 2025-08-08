import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompButton extends StatelessWidget {
  String title;
  Function()? onPress;
  double? width;

  CompButton({
    super.key,
    required this.title,
    required this.onPress,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width ?? double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 12),       
        margin: EdgeInsets.symmetric(horizontal: 20), 
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.onPrimary,
            Theme.of(context).colorScheme.onSecondary,
            Theme.of(context).colorScheme.onTertiary,
          ]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ), 
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}