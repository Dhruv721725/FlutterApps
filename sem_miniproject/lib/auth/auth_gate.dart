import 'package:sem_miniproject/auth/log_or_reg.dart';
import 'package:sem_miniproject/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:sem_miniproject/theme/theme_provider.dart';
// import 'package:provider/provider.dart';

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
          }
          if(snapshot.hasData){
            return HomePage();
          }else{
            return LogOrReg();
          }
        },
      ),
    );
  }
}