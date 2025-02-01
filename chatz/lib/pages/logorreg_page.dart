import 'package:chatz/pages/login_page.dart';
import 'package:chatz/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogorregPage extends StatefulWidget{
  @override
  State<LogorregPage> createState() => _LogorregPageState();
}

class _LogorregPageState extends State<LogorregPage> {
  bool showLoginPage=true;

  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages,);
    }else{
      return RegisterPage(onTap: togglePages,);
    }
  }
}