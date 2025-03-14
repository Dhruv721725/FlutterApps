import 'package:chatbot/auth/auth_services.dart';
import 'package:chatbot/components/comp_button.dart';
import 'package:chatbot/components/comp_textfield.dart';
import 'package:chatbot/firestore/fire_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  void Function() togglePage;

  RegisterPage({
    super.key,
    required this.togglePage,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool obscurePass=true;
  bool obscureConfirmPass=true;
  AuthServices _auth = AuthServices();
  FireStore _fireStore = FireStore();
  void register()async{
    String emailtext=email.text;
    String nametext=name.text;
    String pass=password.text;
    String cnfrmpass=confirmPassword.text;

    if(pass!=cnfrmpass){
      warning("Password and Confirm Password do not match.");
    }else if (emailtext!="" && nametext!="" && pass!="") {
      try {
        await _auth.register(email.text, password.text);
        _fireStore.adduser(nametext, emailtext, pass);
      } catch (e) {
        warning(e.toString());
      }
    }else{
      warning("Empty Entries");
    }
  }

  void warning(String text){
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        content: Text(text, textAlign: TextAlign.center,),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // head icon
            Icon(Icons.person, size: 120,),
            SizedBox(height: 25,),
            // welcome statement
            Text("Welcome, register now to use chatbot.", 
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),        
            ),
            SizedBox(height: 25,),

            // textfield for name
            CompTextfield(
              controller: name, 
              hintText: "name..."
            ),

            // textfield for email            
            CompTextfield(
              controller: email, 
              hintText: "email..."
            ),

            // textfield for password
            CompTextfield(
              controller: password, 
              hintText: "password...",
              obscureText: obscurePass,
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    obscurePass=!obscurePass;
                  });
                }, 
                icon: Icon(
                  obscurePass?Icons.visibility : Icons.visibility_off ,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              ),
            ),

            // textfield for password
            CompTextfield(
              controller: confirmPassword, 
              hintText: "confirm password...",
              obscureText: obscureConfirmPass,
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    obscureConfirmPass=!obscureConfirmPass;
                  });
                }, 
                icon: Icon(
                  obscureConfirmPass?Icons.visibility : Icons.visibility_off ,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              ),
            ),

            // button to login
            CompButton(
              onTap: ()=>register(), 
              text: "Register Now"
            ),
            SizedBox(height: 25),

            // link to toggle page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a member? "),
                GestureDetector(
                  onTap: (){
                    widget.togglePage();
                  },
                  child: Text("Log In now.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}