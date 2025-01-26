import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.edit, size: 50,), Text("CRUD", style: TextStyle(fontSize: 25),)],
            ))
          ],
        ),
      ),
    );
  }
}
