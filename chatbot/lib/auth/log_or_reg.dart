import 'package:chatbot/pages/login_page.dart';
import 'package:chatbot/pages/register_page.dart';
import 'package:flutter/widgets.dart';

class LogOrReg extends StatefulWidget{
  
  @override
  State<LogOrReg> createState() => _LogOrRegState();
}

class _LogOrRegState extends State<LogOrReg> {
  bool showLoginPage = true;

  void togglePage(){
    setState(() {
      showLoginPage=!showLoginPage;
    });    
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(togglePage: togglePage,);
    }else{
      return RegisterPage(togglePage: togglePage,);
    }
  }
}