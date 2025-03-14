import 'package:chatbot/auth/log_or_reg.dart';
import 'package:chatbot/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthGate extends StatelessWidget{
  FirebaseAuth _auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _auth.authStateChanges(), 
        builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Theme.of(context).colorScheme.inversePrimary,),
            );
          }else if(snapshot.hasData){
            return HomePage();
          }else{
            return LogOrReg();
          }
        },
      ),
    );
  }
}