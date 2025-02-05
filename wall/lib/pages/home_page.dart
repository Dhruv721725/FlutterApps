import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wall/components/comp_drawer.dart';

class HomePage extends StatelessWidget {
  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_auth.currentUser!.email.toString().split("@")[0]),
        actions: [
          IconButton(onPressed: _auth.signOut, icon: Icon(Icons.logout))
        ],
      ),
      drawer:CompDrawer(),
    );
  }
}