import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tfb/pages/home_page.dart';
import 'package:tfb/pages/log_or_reg.dart';

class AuthGate extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
      stream: _auth.authStateChanges(), 
      builder: (context,snapshot){
        if (snapshot.connectionState==ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator()
          );
        }else if(!snapshot.hasData){
          return LogOrReg();
        }else{
          return HomePage();
        }
      }
    );
  }
}