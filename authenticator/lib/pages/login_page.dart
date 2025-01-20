import 'dart:io';

import 'package:authenticator/components/comp_button.dart';
import 'package:authenticator/components/comp_textfield.dart';
import 'package:authenticator/components/comp_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController loginIdController=new TextEditingController();
    TextEditingController passwordController=new TextEditingController();

    void signUserIn()async{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginIdController.text, password: passwordController.text);
    }
    return Scaffold(
      // body: Image.asset("lib/images/google_icon.png"),
      backgroundColor: Colors.grey[300],
      body:SafeArea(
        child: Center(
          child: Column(
            children: [
            SizedBox(height: 50,),

            // logo
            Icon(
              Icons.lock,
              size: 150,
            ),
            SizedBox(height: 50,),

            // text
            Text("Welcome back, you've been missed.",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25,),

            // text field
            CompTextfield(
              controller: loginIdController,
              hintText: "Username",
              obscureText: false,
            ),
            SizedBox(height: 10,),
            // password
            CompTextfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            SizedBox(height: 10,),

            // forgot password
            Text("Forgot Password?"),
            SizedBox(height: 25,),
            // sign in button
            CompButton(
              text: "Sign In",
              onTap: signUserIn,
            ),

            SizedBox(height: 25,),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                  Text("Or continue with",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            // google & apple sign in buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CompTile(imagePath: "lib/images/google_icon.png"),
                CompTile(imagePath: "lib/images/apple_icon.png"),
              ],
            ),
            SizedBox(height: 20,),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?"),
                SizedBox(width: 5,),
                Text("Register now",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight:FontWeight.bold,
                  ),
                )
              ],
            ),
            ],
          ),
        ),
      )
    );
  }
}