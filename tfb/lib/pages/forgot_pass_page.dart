import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tfb/components/comp_alert.dart';
import 'package:tfb/components/comp_button.dart';
import 'package:tfb/components/comp_field.dart';
import 'package:tfb/services/auth_services.dart';

class ForgotPassPage extends StatefulWidget {
  ForgotPassPage({
    super.key,
  });

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  TextEditingController emailController = new TextEditingController(); 

  AuthServices _auth = new AuthServices(); 

  void forgotPass()async{
    if (emailController.text.isEmpty) {
      showDialog(context: context, 
      builder: (context)=>CompAlert(
        text: "Check For Empty Entries!")
      );
    }else{
      try {
        await _auth.resetPassword(emailController.text);
        showDialog(context: context, 
          builder: (context)=>CompAlert(
            text: "Reset password email has sent.\nCheck spam, if not found."
          )
        );
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
            children: [
              Container(
                width: double.maxFinite,
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: ()=>Navigator.pop(context), 
                  icon: Icon(Icons.arrow_back),
                ),
              ),
      
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/login.json',
                      fit: BoxFit.cover,
                      height: 150,
                      repeat: true
                    ),
                
                    SizedBox(height: 20,),
                
                    Text("Enter e-mail to recieve reset link.",
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
                
                    SizedBox(height: 10,),
                    CompButton(
                      onPress: forgotPass,
                      title: "Send"
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}