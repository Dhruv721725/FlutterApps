import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user= FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.grey[400],
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap:()async{await FirebaseAuth.instance.signOut();},
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Center(child: Text("Logged in as ${user.email!}")),
    );
  }
}