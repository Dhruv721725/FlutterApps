import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall/components/comp_tile.dart';
import 'package:wall/pages/auth/login_page.dart';
import 'package:wall/pages/auth/logorreg.dart';
import 'package:wall/pages/home_page.dart';
import 'package:wall/pages/profile_page.dart';
import 'package:wall/pages/users_page.dart';
import 'package:wall/services/auth/auth_service.dart';

class CompDrawer extends StatelessWidget{
  AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    Color color=Theme.of(context).colorScheme.inversePrimary;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // drawer header
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.deblur, size: 80, color: color),
                  SizedBox(height: 10,),
                  Text("W A L L", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ],
              ),
            ),    
            // home tile
            Expanded(
              child: Column(
                children: [
                  CompTile(icon: Icon(Icons.home, color: color,), text: "H O M E", onTap: ()=>Navigator.pushNamed(context,"/home")),
                  // users tile
                  CompTile(icon: Icon(Icons.people, color: color), text: "U S E R S", onTap: ()=>Navigator.pushNamed(context,"/users"),),
                  // profile tile
                  CompTile(icon: Icon(Icons.person, color: color), text: "P R O F I L E", onTap:()=>Navigator.pushNamed(context,"/profile"),),
                ],
              ),
            ),
            CompTile(icon: Icon(Icons.logout,color: color,), text: "Logout", onTap: ()=>_auth.signOut()),
          ],
        ),
      ),
    );
  }
}