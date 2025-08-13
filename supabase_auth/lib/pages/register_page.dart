import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_auth/components/comp_button.dart';
import 'package:supabase_auth/components/comp_textfield.dart';

class RegisterPage extends StatefulWidget{

  Function()? toggle;
  RegisterPage({
    required this.toggle,
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailc = TextEditingController();
  TextEditingController namec = TextEditingController();
  TextEditingController passc = TextEditingController();
  TextEditingController cnfrmpassc = TextEditingController();

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
              "Welcome to Supabase Authetications.",
              style: TextStyle(
                fontFamily: GoogleFonts.orbitron().fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
        
            SizedBox(height:20),
        
// name,
            CompTextfield(
              controller: namec, 
              hintText: "Name", 
              obscureText: false
            ),
        
            SizedBox(height: 10,),
                
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
            
            SizedBox(height: 10,),

            CompTextfield(
              controller: cnfrmpassc, 
              hintText: "Confirm Password", 
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
    
            SizedBox(height: 20,),
// Register button
            CompButton(
              onTap: (){}, 
              title: "Register"
            ),

            SizedBox(height: 10,),
            
            GestureDetector(
              onTap: this.widget.toggle,
              child: Text("Already a member? Login."),
            )
          ],
        ),
      ),
    );
  }
}