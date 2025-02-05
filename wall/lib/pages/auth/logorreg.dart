import 'package:flutter/material.dart';
import 'package:wall/pages/auth/login_page.dart';
import 'package:wall/pages/auth/register_page.dart';

class Logorreg extends StatefulWidget{
  @override
  State<Logorreg> createState() => _LogorregState();
}

class _LogorregState extends State<Logorreg> {
  bool isLogin=true;

  void togglePage(){
    setState(() {
      isLogin=!isLogin;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(onTap: togglePage,);
    }else{
      return RegisterPage(onTap: togglePage,);
    }
  }
}