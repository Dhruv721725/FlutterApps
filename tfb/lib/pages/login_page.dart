import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tfb/components/comp_alert.dart';
import 'package:tfb/components/comp_button.dart';
import 'package:tfb/components/comp_field.dart';
import 'package:tfb/pages/forgot_pass_page.dart';
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      // animation
              Lottie.asset(
                'assets/login.json',
                fit: BoxFit.cover,
                height: 150,
                repeat: true
              ),
      
              SizedBox(height: 20,),
      
              Text("Welcome back! You have been missed.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
      
              SizedBox(height: 20,),
      // email field
              CompField(
                controller: emailController, 
                hintText: "email", 
                obscureText: false
              ),
      // password field
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
      // forgot password
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>ForgotPassPage()));
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
        // login button
              SizedBox(height: 10,),
              CompButton(
                onPress: loginAcc,
                title: "Login"
              ),
      
              SizedBox(height: 10,),
              
              Text("Or continue with",
                style: TextStyle(
                  fontFamily: "rajdhani",
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.w300
                ),
              ),
              
              SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
      // google sign in
                  GestureDetector(
                    onTap: ()async{
                      try {
                        await _auth.google_SignIn();
                      } on Exception catch (e) {
                        print(e.toString());
                        showDialog(
                          context: context, 
                          builder: (context)=>CompAlert(text: "An error occured!")
                        );
                      }
                    },
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary
                        ),
                      ),
                      child: Image.asset('assets/google_icon.png'                    
                      ),
                    ),
                  ),
      
        //               SizedBox(width: 20,),
        //               Container(
        //                 width: 2,
        //                 color: Theme.of(context).colorScheme.secondary,
        //                 height:100,
        //               ),
        //               SizedBox(width: 20,),
        // // apple sign in
        //               GestureDetector(
        //                 onTap: (){
        //                   _auth.google_SignIn();
        //                 },
        //                 child: Container(
        //                   height: 80,
        //                   padding: EdgeInsets.all(8),
        //                   decoration: BoxDecoration(
        //                     color: Theme.of(context).colorScheme.primary,
        //                     borderRadius: BorderRadius.circular(20),
        //                     border: Border.all(
        //                       color: Theme.of(context).colorScheme.secondary
        //                     ),
        //                   ),
        //                   child: Image.asset('images/apple_icon.png'                    
        //                   ),
        //                 ),
        //               ),
                ],
              ),
      
      // login or register. 
              SizedBox(height: 20,),
      
              GestureDetector(
                onTap: widget.toggle,
                child: Text("Not a member! SignUp here",
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
      ),
    );
  }
}