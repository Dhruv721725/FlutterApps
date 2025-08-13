import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_auth/components/comp_button.dart';
import 'package:supabase_auth/components/comp_textfield.dart';
import 'package:supabase_auth/pages/forgot_password_page.dart';

class LoginPage extends StatefulWidget{

  Function()? toggle;
  LoginPage({
    required this.toggle,
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailc = TextEditingController();

  TextEditingController passc = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'tree.json',
              fit:BoxFit.cover,
              height:200,
              repeat:true, 
            ),
        
            SizedBox(height:20),
        
            Text(
              "Welcome Back! You have been missed.",
              style: TextStyle(
                fontFamily: GoogleFonts.orbitron().fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
        
            SizedBox(height:20),
        
// email,
            CompTextfield(
              controller: emailc, 
              hintText: "Email", 
              obscureText: false
            ),
        
            SizedBox(height: 10,),
        
// password,
            CompTextfield(
              controller: passc, 
              hintText: "Password", 
              obscureText: obscureText,
              suffix: IconButton(
                onPressed: (){
                  setState(() {
                    obscureText=!obscureText;
                  });
                }, 
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
        
            SizedBox(height: 5,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordPage()));
                  },
                  child: Text("forgot password?")
                ),
              ],
            ),
    
            SizedBox(height: 20,),
// login button
            CompButton(
              onTap: (){}, 
              title: "Login"
            ),
    
            SizedBox(height: 10,),
    
            Text("Or continue with"),
    
            SizedBox(height: 5,),
            
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.all(8),
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary.withAlpha(50),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset("assets/google_icon.png"),
              ),
            ),

            SizedBox(height: 10,),
            
            GestureDetector(
              onTap: this.widget.toggle,
              child: Text("Not a member? Register now."),
            )
          ],
        ),
      ),
    );
  }
}