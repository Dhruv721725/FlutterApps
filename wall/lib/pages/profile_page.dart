import 'package:flutter/material.dart';
import 'package:wall/components/comp_drawer.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: CompDrawer(),
    );
  }
}