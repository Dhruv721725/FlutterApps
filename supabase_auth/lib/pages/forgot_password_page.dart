import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_auth/components/comp_button.dart';
import 'package:supabase_auth/components/comp_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  TextEditingController emailc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.tertiary,)
              ),
          
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "tree.json",
                    height: 200,
                    fit: BoxFit.cover,
                    repeat: true
                  ),
              
                  SizedBox(height:10),
                      
                  Text(
                    "Reset your password here.",
                    style: TextStyle(
                      fontFamily: GoogleFonts.orbitron().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                  ),
              
                  SizedBox(height:10),
              
                  CompTextfield(
                    controller: emailc, 
                    hintText: "Email", 
                    obscureText: false
                  ),
                  SizedBox(height: 20,),
              
                  CompButton(
                    onTap: (){}, 
                    title: "Send Reset Link"
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