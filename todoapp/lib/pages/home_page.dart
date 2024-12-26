import 'package:flutter/material.dart';
import 'package:todoapp/pages/todo_page.dart';
import 'package:todoapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _todos=[
    ["my todos",true],
    ["exercise",true],
    ["gfg",true],
    ["flutter",true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "To Do",
          style: TextStyle(
            fontWeight:FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.orangeAccent,
      body: ListView.builder(
        itemBuilder: itemBuilder
      ),
    );
  }
}
// Light Purple: (218, 177, 218)
// Lavender: (230, 230, 250)
// Purple: (157, 0, 255) or (160, 32, 240)
// Royal Purple: (108, 59, 170) or (120, 81, 169)
// Violet: (143, 0, 255) or (127, 0, 255)
// Neon Purple: (138, 0, 196)
// Plum: (142, 69, 133)
// Blue Purple: (138, 43, 226)
// Bright Purple: (191, 64, 191)
