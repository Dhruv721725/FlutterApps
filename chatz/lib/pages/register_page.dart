import 'package:chatz/services/auth/auth_service.dart';
import 'package:chatz/components/comp_button.dart';
import 'package:chatz/components/comp_textfieldd.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  
  TextEditingController _emailController= new TextEditingController();
  TextEditingController _pwController= new TextEditingController();
  TextEditingController _cpwController= new TextEditingController();
  TextEditingController _nameController= new TextEditingController();
  Function()? onTap;

  RegisterPage({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    void register(){
      //  get auth service
      if (_pwController.text!=_cpwController.text) {
        showDialog(context: context, builder: (context)=>AlertDialog(
          content: Text("Password miss-match", textAlign: TextAlign.center,),
        ));
      }else{
        try {
          AuthService()..signUpEmail(_emailController.text, _pwController.text, _nameController.text);

        } catch (e) {
          showDialog(context: context, builder: (context)=>AlertDialog(
            content: Text(e.runtimeType.toString(),textAlign: TextAlign.center,),
          ));
        }
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
          Text("Welcome to our community.",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16
            ),
          ),
          SizedBox(height:25),
          // name text field 
          CompTextfield(
            controller: _nameController, 
            hintText: "Name",
            pass: false,
          ),
          SizedBox(height: 10,),
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

          CompTextfield(
            controller: _cpwController, 
            hintText: "confirm password",
            pass: true,
          ),
          SizedBox(height: 10,),
          
          // login button
          CompButton(value: "Register", onTap: register),
          SizedBox(height: 20,),

          // register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already a member ? "),
              GestureDetector(
                onTap: onTap,
                child: Text("LogIn now", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              )
            ],
          )
        ],
      )),
    );
  }
}