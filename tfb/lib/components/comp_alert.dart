import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompAlert extends StatelessWidget {
  String text;

  CompAlert({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("TFB",
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
      ),
      content: Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Rajdhani",
          color: Theme.of(context).colorScheme.inversePrimary
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}