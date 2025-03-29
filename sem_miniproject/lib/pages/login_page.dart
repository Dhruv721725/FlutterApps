import 'package:sem_miniproject/auth/auth_services.dart';
import 'package:sem_miniproject/components/comp_auth_textfield.dart';
import 'package:sem_miniproject/components/comp_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  void Function() togglePage;

  LoginPage({
    super.key,
    required this.togglePage
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool obscurePass=true;
  AuthServices _auth = AuthServices();

  void login()async{
    String emailtext=email.text.trim();
    String pass=password.text.trim();

    if (emailtext!="" && pass!="") {
      try {
        await _auth.login(emailtext, pass);
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
            Icon(Icons.login, size: 120, color: Colors.green,),
            SizedBox(height: 25,),
            // welcome statement
            Text("Welcome Back, you have been missed.", 
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),        
            ),
            SizedBox(height: 25,),

            // textfield for email
            CompAuthTextfield(
              controller: email,
              hintText: "Email...",
            ),

            // textfield for password
            CompAuthTextfield(
              controller: password,
              hintText: "password...",
              obscureText: obscurePass,
              suffixIcon: IconButton(
                onPressed:(){
                  setState(() {
                    obscurePass=!obscurePass;
                  });
                }, 
                icon: Icon( obscurePass? Icons.visibility: Icons.visibility_off),
              ),
            ),

            // button to login
            CompButton(
              onTap: ()=>login(), 
              text: "Log In"
            ),
            SizedBox(height: 25),

            // link to toggle page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? "),
                GestureDetector(
                  onTap: (){
                    widget.togglePage();
                  },
                  child: Text("Register now.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}