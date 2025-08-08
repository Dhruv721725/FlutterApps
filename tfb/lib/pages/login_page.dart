import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tfb/components/comp_alert.dart';
import 'package:tfb/components/comp_button.dart';
import 'package:tfb/components/comp_field.dart';
import 'package:tfb/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  Function() toggle;
  LoginPage({
    super.key,
    required this.toggle,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController(); 

  TextEditingController passController = new TextEditingController(); 
  
  bool _obscurePass = true;

  AuthServices _auth = new AuthServices(); 

  void loginAcc()async{
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      showDialog(context: context, 
      builder: (context)=>CompAlert(
        text: "Check For Empty Entries!")
      );
    }else{
      try {
        await _auth.logIn(emailController.text, passController.text);
      } on Exception catch (e) {
        String msg = e
          .toString()
          .split(RegExp(r"[:-]+"))
          .sublist(1)
          .map((el)=>el.trim()[0].toUpperCase() + el.trim().substring(1)).join(" ");
        showDialog(
          context: context, 
          builder: (context)=>CompAlert(text: msg)
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'lottieFiles/login.json',
              fit: BoxFit.cover,
              height: 150,
              repeat: true
            ),

            SizedBox(height: 20,),

            Text("Welcome back! You have been missed.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            SizedBox(height: 20,),

            CompField(
              controller: emailController, 
              hintText: "email", 
              obscureText: false
            ),

            CompField(
              controller: passController, 
              hintText: "password", 
              obscureText: _obscurePass,
              suffix: IconButton(
                onPressed:(){
                  setState(() {
                    _obscurePass = !_obscurePass;
                  });
                } , 
                icon: Icon(_obscurePass? Icons.visibility:Icons.visibility_off)
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  
                },
                child: Text("forgot password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "rajdhani",
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),
            CompButton(
              onPress: loginAcc,
              title: "Login"
            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: widget.toggle,
              child: Text("Not a member! SignUp here",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "rajdhani",
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.w300
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}