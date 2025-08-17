import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tfb/components/comp_alert.dart';
import 'package:tfb/components/comp_button.dart';
import 'package:tfb/components/comp_field.dart';
import 'package:tfb/services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  Function() toggle;
  RegisterPage({
    super.key,
    required this.toggle,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = new TextEditingController();

  TextEditingController emailController = new TextEditingController(); 

  TextEditingController passController = new TextEditingController(); 

  TextEditingController cnfrmPassController = new TextEditingController();  

  
  bool _obscurePass = true;
  bool _obscureCnfrmPass = true;

  void registerAcc()async{
    if (nameController.text.isEmpty || emailController.text.isEmpty || passController.text.isEmpty || cnfrmPassController.text.isEmpty) {
      showDialog(context: context, 
      builder: (context)=>CompAlert(
        text: "Check For Empty Entries!")
      );
    }else if(passController.text != cnfrmPassController.text){
      showDialog(context: context, 
      builder: (context)=>CompAlert(
        text: "Passwords do not match!")
      );
    }else{
      try {
        await AuthServices().signUp(nameController.text, emailController.text, passController.text);

      } catch(e) {
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
              Lottie.asset(
                'assets/login.json',
                fit: BoxFit.cover,
                height: 150,
                repeat: true
              ),
      
              SizedBox(height: 20,),
      
              Text("Welcome! to our community.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
      
              SizedBox(height: 20,),
      
              CompField(
                controller: nameController,
                obscureText: false,
                hintText: "name",
              ),
      
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
      
              CompField(
                controller: cnfrmPassController, 
                hintText: "confirm password", 
                obscureText:_obscureCnfrmPass,
                suffix: IconButton(
                  onPressed:(){
                    setState(() {
                      _obscureCnfrmPass = !_obscureCnfrmPass;
                    });
                  } , 
                  icon: Icon(_obscureCnfrmPass? Icons.visibility:Icons.visibility_off)
                ),
              ),
              SizedBox(height: 30,),
              CompButton(
                onPress: registerAcc,
                title: "Register Me"
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: widget.toggle,
                child: Text("Already a member! Login here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "rajdhani",
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w300
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}