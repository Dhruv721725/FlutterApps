import 'package:flutter/material.dart';

class HomePage extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minimal Shop🔥"),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}