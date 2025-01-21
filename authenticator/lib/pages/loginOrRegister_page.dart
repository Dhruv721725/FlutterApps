import 'package:authenticator/pages/login_page.dart';
import 'package:authenticator/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginorregisterPage extends StatefulWidget{
  LoginorregisterPage({
    super.key,
  });

  @override
  State<LoginorregisterPage> createState() => _LoginorregisterPageState();
}

class _LoginorregisterPageState extends State<LoginorregisterPage> {
  bool showLoginPage=true;

  void togglePage(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onRegister: togglePage);
    }else{
      return  RegisterPage(onLogin: togglePage,);
    }
  }
}