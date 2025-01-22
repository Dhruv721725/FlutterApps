import 'package:authenticator/components/comp_button.dart';
import 'package:authenticator/components/comp_textfield.dart';
import 'package:authenticator/components/comp_tile.dart';
import 'package:authenticator/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onLogin;
  RegisterPage({super.key, required this.onLogin});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  TextEditingController loginIdController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  TextEditingController confirmPasswordController=new TextEditingController();
  
  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    );
  }
  
  void signUserUp()async{
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(), 
      );
    });
    try {
      if (passwordController.text==confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: loginIdController.text, 
          password: passwordController.text
        );
        Navigator.pop(context);
      }else{
        Navigator.pop(context);
        showErrorMessage("Password Mismatched");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(
        e.code.split('-')
        .map(
          (word)=>word[0].toUpperCase()+word.substring(1).toLowerCase()
        )
        .join(" ")
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              size: 100,
            ),
            SizedBox(height: 50,),

            // text
            Text("Let's create an account for you.",
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
             
            // confirm password
            CompTextfield(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            SizedBox(height: 25,),
            // sign in button
            CompButton(
              text: "Sign Up",
              onTap: signUserUp,
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
                CompTile(
                  onTap: ()=>AuthService().signInWithGoogle(),
                  imagePath: "lib/images/google_icon.png"),
                CompTile(
                  onTap: ()=>{},
                  imagePath: "lib/images/apple_icon.png"),
              ],
            ),
            SizedBox(height: 20,),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a member?"),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: widget.onLogin ,
                  child: Text("Login now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight:FontWeight.bold,
                    ),
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