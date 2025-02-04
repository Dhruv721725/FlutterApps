import 'package:flutter/material.dart';
import 'package:wall/components/comp_button.dart';
import 'package:wall/components/comp_textfield.dart';
import 'package:wall/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget{
  Function()? onTap;
  LoginPage({super.key, required this.onTap});

  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();

  @override
  Widget build(BuildContext context) {

    void warning(String text){
      showDialog(context: context, builder: (context)=>AlertDialog(
        content: Center(child: Text(text)),
      ));
    }

    AuthService _auth=AuthService();
    void logIn()async{
      try {
        await _auth.signIn(_email.text.trim(), _pass.text);
      } on Exception catch (e) {
        warning(e.toString());
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.deblur, size: 150,),
          SizedBox(height: 50,),
      
          Text("Welcome back, you have been missed."),
          SizedBox(height: 20,),
      
          CompTextfield(controller: _email, hintText: "Email", obscureText: false),
          SizedBox(height: 20,),
      
          CompTextfield(controller: _pass, hintText: "Password", obscureText: true),
          SizedBox(height: 20,),
      
          CompButton(onTap: logIn, text: "Log In"),
          SizedBox(height: 20,),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?"),
              GestureDetector(
                onTap: onTap,
                child: Text("Register now", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              )
            ],
          )
        ],
      ),      
    );
  }
}