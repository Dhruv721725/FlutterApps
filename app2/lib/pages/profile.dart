import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        padding: EdgeInsets.all(100),
        child: Text("Profile"),
        color: const Color.fromARGB(255, 100, 40, 240)
      ),
    );
  }
}