import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wall/components/comp_button.dart';
import 'package:wall/components/comp_functions.dart';
import 'package:wall/components/comp_textfield.dart';
import 'package:wall/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget{

  Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  TextEditingController _user=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
  TextEditingController _confirmPass=TextEditingController();

  Future<void> createUserDocument(userCredential)async{
    if (userCredential!=null && userCredential.user!= null){
      await FirebaseFirestore.instance
        .collection("Users")
        .doc(userCredential.user!.email)
        .set({
          "email":userCredential.user!.email,
          "userName":_user.text,
        });
    } {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth=new AuthService();
    void signUp()async{
      showDialog(
        context: context,
        builder: (context)=>Center(
          child: CircularProgressIndicator(),
        ) 
      );
      if (_pass.text==_confirmPass.text){
        try {
          UserCredential userCredential= await _auth.signUp(_email.text.trim(), _pass.text.trim());
          Navigator.pop(context);

          createUserDocument(userCredential);

        } on Exception catch (e) {
          Navigator.pop(context);
          warning(e.toString().split(":")[1].split("-").map((x)=>x.trim()[0].toUpperCase()+x.trim().substring(1).toLowerCase()).join(" "),context);
        } 

      }else{
        Navigator.pop(context);
        warning("Password miss-match", context);
      }
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.deblur, size: 150,),
          Text("W A L L",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),),
          SizedBox(height: 40,),
      
          Text("Welcome to the community",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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
              Text("Already a member?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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