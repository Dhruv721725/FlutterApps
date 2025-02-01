import 'package:chatz/pages/home_page.dart';
import 'package:chatz/pages/login_page.dart';
import 'package:chatz/pages/logorreg_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return HomePage();
          }else{
            return LogorregPage();
          }
        }
      ),
    );
  }
}