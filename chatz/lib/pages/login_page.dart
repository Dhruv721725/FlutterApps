import 'dart:js_interop';

import 'package:chatz/services/auth/auth_service.dart';
import 'package:chatz/components/comp_button.dart';
import 'package:chatz/components/comp_textfieldd.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{

  TextEditingController _emailController= new TextEditingController();
  TextEditingController _pwController= new TextEditingController();
  Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {

    void logIn()async{
      // auth service 
      final authService=new AuthService();

      try{
        await authService.signInEmail(_emailController.text, _pwController.text);
      }catch(e){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Text(e.toString().split(":")[1].trim().split("-").map((e)=>e[0].toUpperCase()+e.substring(1).toLowerCase()).join(" "),
              textAlign: TextAlign.center,
            ),
          );
        });
      }
    }
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  logo
          Icon(Icons.message, size: 100,color: Theme.of(context).colorScheme.primary,),
          const SizedBox(height: 30,),
          // welcome back message
          Text("Welcome back, you have been missed.",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16
            ),
          ),
          SizedBox(height:25),

          // email text field
          CompTextfield(
            controller: _emailController, 
            hintText: "Email",
            pass: false,
          ),
          SizedBox(height: 10,),

          // pw text field
          CompTextfield(
            controller: _pwController, 
            hintText: "password",
            pass: true,
          ),
          SizedBox(height: 10,),
          
          // login button
          CompButton(value: "Log In", onTap: logIn),
          SizedBox(height: 20,),

          // register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member ? "),
              GestureDetector(
                onTap: onTap,
                child: Text("Register now", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              )
            ],
          )
        ],
      )),
    );
  }
}

