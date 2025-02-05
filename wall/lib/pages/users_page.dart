import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wall/components/comp_drawer.dart';

class  UsersPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      drawer: CompDrawer(),
    );
  }
}