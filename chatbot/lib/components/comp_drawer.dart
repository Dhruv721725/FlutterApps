import 'package:chatbot/pages/home_page.dart';
import 'package:chatbot/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          )
        ],
      ),
    );
  }
}