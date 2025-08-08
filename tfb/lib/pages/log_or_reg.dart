// Platform  Firebase App Id
// web       1:53716473918:web:1ef3149d4684151245196f
// android   1:53716473918:android:e90a43eb2f182d2945196f

import 'package:flutter/material.dart';
import 'package:tfb/pages/login_page.dart';
import 'package:tfb/pages/register_page.dart';

class LogOrReg extends StatefulWidget {
  @override
  State<LogOrReg> createState() => _LogOrRegState();
}

class _LogOrRegState extends State<LogOrReg> {
  bool showLoginPage = true;
  void toggle(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(toggle: toggle,);
    }else{
      return RegisterPage(toggle: toggle);
    }
  }
}
