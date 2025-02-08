import 'package:flutter/material.dart';
import 'package:wall/components/comp_button.dart';
import 'package:wall/components/comp_functions.dart';
import 'package:wall/components/comp_textfield.dart';
import 'package:wall/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget{
  Function()? onTap;
  LoginPage({super.key, required this.onTap});

  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();

  @override
  Widget build(BuildContext context) {

    

    final AuthService _auth=new AuthService();
    void logIn()async{
      try {
        await _auth.signIn(_email.text.trim(), _pass.text);
      } on Exception catch (e) {
        warning(e.toString().split(":")[1].split("-").map((x)=>x.trim()[0].toUpperCase()+x.trim().substring(1).toLowerCase()).join(" "),context);
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.deblur, size: 150,),
          Text("W A L L",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),),
          SizedBox(height: 40,),
      
          Text("Welcome back, you have been missed.", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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
              Text("Not a member?",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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