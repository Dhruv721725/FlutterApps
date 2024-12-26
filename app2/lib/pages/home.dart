import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        padding: EdgeInsets.all(100),
        child: Text("Home"),
        color: const Color.fromARGB(255, 180, 50, 130),
      ),
    );
  }
}