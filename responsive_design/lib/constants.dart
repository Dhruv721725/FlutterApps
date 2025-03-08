import 'package:flutter/material.dart';

var backColor=Colors.grey.shade300;

var compAppbar=AppBar(
  backgroundColor: Colors.grey.shade800,
);

var CompDrawer=Drawer(
  backgroundColor:Colors.grey.shade300,
  child: Column(
    children: [
      DrawerHeader(
        child:Icon(Icons.favorite) 
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text("D A S H B O A R D"),  
      ),
      ListTile(
        leading: Icon(Icons.chat),
        title: Text("C H A T"),  
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("S E T T I N G S"),  
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("L O G O U T"),  
      )
    ],
  ),
);