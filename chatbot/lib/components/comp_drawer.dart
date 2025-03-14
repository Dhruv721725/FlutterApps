import 'package:chatbot/auth/auth_services.dart';
import 'package:chatbot/auth/log_or_reg.dart';
import 'package:chatbot/pages/home_page.dart';
import 'package:chatbot/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // header
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // icon
                  Icon(Icons.rocket, size: 50,),
        
                  // Jimmy
                  Text("Jimmy",  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),)
                ],
              )
            ),
        
            // home
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
                    child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                  ),
                  
                  // settings
                  GestureDetector(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage())),
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                    ),
                  ),
                ],
              ),
            ),
            // Log out 
            GestureDetector(
              onTap: (){
                AuthServices _auth = AuthServices();
                _auth.logOut();
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LogOrReg()));
              },
              child: ListTile(
                title: Text("Log Out"),
                trailing: Icon(Icons.logout),
              ),
            )
          ],
        ),
      ),
    );
  }
}