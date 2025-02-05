import 'package:flutter/material.dart';
import 'package:wall/components/comp_button.dart';
import 'package:wall/components/comp_textfield.dart';
import 'package:wall/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget{

  Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  TextEditingController _user=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
  TextEditingController _confirmPass=TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    void warning(String text){
      showDialog(context: context, builder: (context)=>AlertDialog(
        content: Text(text, textAlign: TextAlign.center,)
      ));
    }
    final AuthService _auth=new AuthService();
    void signUp()async{
      if (_pass.text==_confirmPass.text){
        try {
          await _auth.signUp(_email.text.trim(), _pass.text.trim());
        } on Exception catch (e) {
          warning(e.toString().split(":")[1].split("-").map((x)=>x.trim()[0].toUpperCase()+x.trim().substring(1).toLowerCase()).join(" "));
        }
      }else{
        warning("Password miss-match");
      }
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.deblur, size: 150,),
          Text("W A L L",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          SizedBox(height: 40,),
      
          Text("Welcome to the community"),
          SizedBox(height: 20,),
          
          CompTextfield(controller: _user, hintText: "User Name", obscureText: false),
          SizedBox(height: 20,),

          CompTextfield(controller: _email, hintText: "Email", obscureText: false),
          SizedBox(height: 20,),
      
          CompTextfield(controller: _pass, hintText: "Password", obscureText: true),
          SizedBox(height: 20,),

          CompTextfield(controller: _confirmPass, hintText: "Confirm Password", obscureText: true),
          SizedBox(height: 20,),
      
          CompButton(onTap: signUp, text: "Register"),
          SizedBox(height: 20,),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already a member?"),
              GestureDetector(
                onTap: onTap,
                child: Text("Login here", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              )
            ],
          )
        ],
      ),      
    );
  }
}