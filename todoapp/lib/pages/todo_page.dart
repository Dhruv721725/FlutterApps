import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todoapp/util/todo_tile.dart';

class TodoPage extends StatefulWidget {
  @override
  State<TodoPage> createState()=> _TodoPageState();
}

class _TodoPageState extends State<TodoPage>{
  List<Widget> _todos=<Widget>[];
  
  TextEditingController mycontroller=new TextEditingController();

  void addTodo(){
    String todo=mycontroller.text.trim();
    if (todo!="") {
      setState(() {  
        _todos.add(Text("data"));
        mycontroller.value=TextEditingValue.empty;      
      }); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: ListView(
        children: _todos,
      )
    );
  }
}