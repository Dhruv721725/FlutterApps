import 'package:flutter/material.dart';
import 'package:supabase_auth/pages/login_page.dart';
import 'package:supabase_auth/pages/register_page.dart';

class LogOrReg extends StatefulWidget {
  
  @override
  State<LogOrReg> createState()=> _LogOrRegState();
}

class _LogOrRegState extends State<LogOrReg>{
  
  bool showLoginPage = true;

  void toggle(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(toggle: toggle);
    }else{
      return RegisterPage(toggle: toggle);
    }
  }
}